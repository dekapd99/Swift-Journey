import UIKit

//Equality Protocol
struct Person: Equatable {
    let id: String
    let name: String
}

let person1 = Person(id: "1", name: "Deka")
let person2 = Person(id: "1", name: "Primatio")

if person1 == person2 {
    "They are the same Person..."
} else {
    "Not the same Person!"
}

///Only Comparing id (Uncomment code below)
//extension Person {
//    static func == (lhs: Self, rhs: Self) -> Bool {
//        lhs.id == rhs.id
//    }
//}

enum AnimalType {
    case dog(breed: String)
    case cat(breed: String)
}

///Custom Implementation of Equatable (Adding some functionality)
extension AnimalType: Equatable {
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        switch (lhs, rhs) {
        case let (.dog(lhsBreed), .dog(rhsBreed)),
            let (.cat(lhsBreed), .cat(rhsBreed)):
            return lhsBreed == rhsBreed
            
        default:
            return false
        }
    }
}

struct Animal: Equatable {
    let name: String
    let type: AnimalType
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "whiskers", type: AnimalType.cat(breed: "Street Cat"))
let cat2 = Animal(name: "whoosh", type: AnimalType.cat(breed: "Street Cat"))

if cat1 == cat2 {
    "They are equal because of their type."
} else {
    "They are not equal"
}

//let dog1 = AnimalType.dog(breed: "Labradoodle")
//let dog2 = AnimalType.dog(breed: "Labradoodle")
//
//if dog1 == dog2 {
//    "They are equal"
//} else {
//    "They are not equal"
//}


//MARK: - HASHABLE
struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(number: 123, numberOfBedrooms: 2)
house1.hashValue
let house2 = House(number: 123, numberOfBedrooms: 3)
house2.hashValue

let houses = Set([house1, house2])
houses.count

struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(number: 123, numberOfBedrooms: 2)
let house4 = NumberedHouse(number: 123, numberOfBedrooms: 3)

let houses3And4 = Set([house3, house4])
houses3And4.count
house3.hashValue
house4.hashValue
house3.number.hashValue
house4.number.hashValue
houses3And4.first!.numberOfBedrooms

//MARK: -
enum CarPart {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [
    .roof,
    .tire,
    .roof,
    .trunk
]

enum HouseType: Hashable {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(
    NumberedHouse(number: 1, numberOfBedrooms: 1)
)

let bigHouse2 = HouseType.bigHouse(
    NumberedHouse(number: 1, numberOfBedrooms: 1)
)

let smallHouse1 = HouseType.smallHouse(
    NumberedHouse(number: 1, numberOfBedrooms: 1)
)

let allHouses: Set<HouseType> = [
    bigHouse1,
    bigHouse2,
    smallHouse1
]

allHouses.count

for value in allHouses {
    print(value)
}
