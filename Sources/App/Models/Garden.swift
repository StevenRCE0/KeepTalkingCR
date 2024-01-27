import Fluent
import Vapor
import WebAuthn

final class Garden: Model, Content {
    static let schema: String = "gardens"

    @ID
    var id: UUID?
    
    @Field(key: "name")
    var name: String?
    
    @Field(key: "offer")
    var nodeToNodeoffer: String?
    var clientToNodeOffer: String?
    var clientToClientOffer: String?

    @Field(key: "nodeToNodeOfferCandidates")
    var nodeToNodeOfferCandidates: [String]
    @Field(key: "nodeToNodeAnswerCandidates")
    var nodeToNodeAnswerCandidates: [String]
    @Field(key: "clientToNodeOfferCandidates")
    var ClientToNodeOfferCandidates: [String]
    @Field(key: "clientToNodeAnswerCandidates")
    var ClientToNodeAnswerCandidates: [String]
    @Field(key: "clientToClientOfferCandidates")
    var ClientToClientOfferCandidates: [String]
    @Field(key: "clientToClientAnswerCandidates")
    var ClientToClientAnswerCandidates: [String]

    @Timestamp(key: "created_at", on: .create)
    var createdAt: Date?
    
    

    @Siblings(through: GardenUser.self, from: \.$garden, to: \.$user)
    var users: [User]

    init() {}

    init(id: UUID? = nil, name: String?) {
        self.id = id
        self.name = name
    }
}

extension Request {
    struct GardenCreationRequest: Content {
        var name: String?
    }
}
