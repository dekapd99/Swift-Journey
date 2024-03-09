import UIKit
//For Loops merupakan conditional seperti IF / ELSE statement.
///Ada 2 cara dalam menggunakan For Loop:
///1. Iterate over a Collection
///2. Do something x number of times (Common ways)

//1. Iterate Over a Collection
let allStars = ["James", "Davis", "Harden", "Doncic", "Leonard"]

///For every Player in allStars array, i want to print their name
for player in allStars {
    print(player)
}

///For every Player in allStars array, i want to print their name if their name is Harden
for player in allStars where player == "Harden" {
    print(player)
}

//2. Do something x number of times (Common ways)
///Starting from 0 to less than 25 (meaning 24 as the Last Value)
for i in 0..<25 {
    print(i)
}

//Another Example
var randomInts: [Int] = [] ///Create an Empty Array of Integer as Intialization

///We want to Adding a random number from 0 to 100, for 25 times into the Empty Array
/// _ meaning if the For Loops variable doesn't even used just use the _ (underscore) to avoid confusion
for _ in 0..<25 {
    let randomNumber = Int.random(in: 0...100) ///Random Number from 0 to 100
    randomInts.append(randomNumber)
}

print(randomInts)
