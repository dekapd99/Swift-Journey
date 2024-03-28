import UIKit
import PlaygroundSupport
import _Concurrency

//Concurrency / Asynchronous Programming

PlaygroundPage
    .current
    .needsIndefiniteExecution = true

func calculateFullName(firstName: String, lastName: String) async -> String {
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}

Task {
    let result1 = await calculateFullName(firstName: "Deka", lastName: "Primatio")
    
    async let result2 = calculateFullName(firstName: "Deka", lastName: "Primatio")
    await result2
}

//MARK: -
enum Clothe {
    case socks, shirt, trousers
}

func buySocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.trousers
}

struct Ensemble: CustomDebugStringConvertible {
    let clothes: [Clothe]
    let totalPrice: Double
    
    var debugDescription: String {
        "Clothes = \(clothes), price = \(totalPrice)"
    }
}

func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buySocks()
    async let shirts = buyShirt()
    async let trousers = buyTrousers()
    
    let ensemble = Ensemble(clothes: await [
        try socks,
        try shirts,
        try trousers
    ], totalPrice: 200)
    
    return ensemble
}

Task {
    if let ensemble = try? await buyWholeEnsemble() {
        ensemble
    } else {
        "Something went wrong"
    }
}

func getFullName(delay: Duration, calculator: () async -> String) async -> String {
    try? await Task.sleep(for: delay)
    return await calculator()
}

func fullName() async -> String { "Deka Primatio" }

Task {
    await getFullName(
        delay: .seconds(1)) {
            async let name = fullName()
            return await name
        }
}
