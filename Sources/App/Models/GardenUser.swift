import Fluent

final class GardenUser: Model {
    static let schema = "garden+user"
    
    @ID
    var id: UUID?
    
    @Parent(key: "garden")
    var garden: Garden
    
    @Parent(key: "user")
    var user: User
    
    init() {}
    
    init(id: UUID? = nil, garden: Garden, user: User) throws {
        self.id = id
        self.$garden.id = try garden.requireID()
        self.$user.id = try user.requireID()
    }
}
