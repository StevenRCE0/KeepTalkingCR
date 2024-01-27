import Vapor
import Fluent

struct GardenMethods: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let gardenRoutes = routes.grouped("garden")
        gardenRoutes.post(use: create)
    }
    
    func create(req: Request) async throws -> String {
        let content: Request.GardenCreationRequest?
        do {
            try content = req.content.decode(Request.GardenCreationRequest.self)
        }
        let newGarden = Garden(name: content?.name)
        try await newGarden.create(on: req.db)
        guard newGarden.id != nil else {
            throw EntityError.Summon(dealing: "garden")
        }
        
        return newGarden.id!.uuidString
    }
}
