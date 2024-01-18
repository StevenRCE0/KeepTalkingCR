import Vapor

struct MakeCredentialResponse: Content {
    let userID: String
    let challenge: String
}

struct StartAuthenticateResponse: Content {
    let challenge: String
    let credentials: [WebAuthnCredential]
}
