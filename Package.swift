// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "KeepTalkingCR",
    platforms: [
       .macOS(.v13)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.89.0"),
        // 🗄 An ORM for SQL and NoSQL databases.
        .package(url: "https://github.com/vapor/fluent.git", from: "4.8.0"),
        // 🪶 Fluent driver for SQLite.
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0"),
        .package(url: "https://github.com/m-barthelemy/vapor-queues-fluent-driver.git", from: "3.0.0-beta1"),
        // WebAuthn Passkey
        .package(url: "https://github.com/swift-server/webauthn-swift.git", from: "1.0.0-alpha"),
        .package(url: "https://github.com/swiftpackages/DotEnv.git", from: "3.0.0"),
    ],
    targets: [
        .executableTarget(
            name: "App",
            dependencies: [
                .product(name: "Fluent", package: "fluent"),
                .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
                .product(name: "QueuesFluentDriver", package: "vapor-queues-fluent-driver"),
                .product(name: "Vapor", package: "vapor"),
                .product(name: "WebAuthn", package: "webauthn-swift"),
                .product(name: "DotEnv", package: "DotEnv"),
            ]
        ),
        .testTarget(name: "AppTests", dependencies: [
            .target(name: "App"),
            .product(name: "XCTVapor", package: "vapor"),

            // Workaround for https://github.com/apple/swift-package-manager/issues/6940
            .product(name: "Vapor", package: "vapor"),
            .product(name: "Fluent", package: "Fluent"),
            .product(name: "FluentSQLiteDriver", package: "fluent-sqlite-driver"),
        ])
    ]
)
