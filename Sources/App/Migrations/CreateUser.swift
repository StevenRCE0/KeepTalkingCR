import Fluent

struct CreateUser: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(User.schema)
            .id()
            .field("username", .string, .required)
            .field("created_at", .datetime, .required)
            .unique(on: "username")
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema(User.schema).delete()
    }
}
