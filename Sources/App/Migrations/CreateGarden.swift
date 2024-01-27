import Fluent

struct CreateGarden: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema(Garden.schema)
            .id()
            .field("name", .string)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("").delete()
    }
}

