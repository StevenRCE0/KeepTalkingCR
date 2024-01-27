# Keep Talking CR

This repository contains the source code of the Central Registery "Keep Talking" project, which is a module to register users using WebAuthn for nodes to fetch their OfferIDs. 

Because the "Keep Talking" is a decentralised project, the managed registration would optional and replaceable. However, the ICEServer which is crucial for WebRTC to discover peers is not, but you may choose your favourite servers. 

# 🚧 This Repo is Under Construction 🚧

...and it's far from done

## Roadmap

Even the roadmap is a rather ambiguous one:

- [x] Make WebAuthn backend kinda working (SQLite would do). 
- [ ] Complete Models. 
- [ ] Pass the minimal testing.
- [ ] Eventually the signalling server will be integrated into this project, but let's use Google's Firebase for now...
- [ ] ...

# Thanks to

- [brokenhandsio/Vapor-PasskeyDemo](https://github.com/brokenhandsio/Vapor-PasskeyDemo)
- Vapor
- [swift-server/WebAuthn-Swift](https://github.com/swift-server/webauthn-swift)
