import Fluent
import FluentSQLiteDriver
import Vapor
import WebAuthn
import QueuesFluentDriver

// configures your application
public func configure(_ app: Application) throws {

    app.middleware.use(app.sessions.middleware)
    app.sessions.use(.memory)

    if app.environment == .testing {
        app.databases.use(.sqlite(.file(Environment.get("SQLITE_DATABASE_PATH") ?? "db.sqlite")), as: .sqlite)
    } else {
        app.databases.use(.sqlite(.memory), as: .sqlite)
    }

    app.migrations.add(JobMetadataMigrate())
    app.migrations.add(CreateUser())
    app.migrations.add(CreateWebAuthnCredential())

    app.queues.use(.fluent())
    try app.queues.startInProcessJobs(on: .default)

    app.queues.schedule(DeleteUsersJob()).hourly().at(0)
    try app.queues.startScheduledJobs()

    app.webAuthn = WebAuthnManager(
        config: WebAuthnManager.Config(
            relyingPartyID: Environment.get("RP_ID") ?? "localhost",
            relyingPartyName: Environment.get("RP_DISPLAY_NAME") ?? "Vapor Passkey Demo",
            relyingPartyOrigin: Environment.get("RP_ORIGIN") ?? "http://localhost:8080"
        )
    )

    // register routes
    try routes(app)

    try app.autoMigrate().wait()
}
