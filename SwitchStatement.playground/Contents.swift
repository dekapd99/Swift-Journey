import UIKit
//Switch Statement merupakan bagian dari Conditional Loops seperti IF / ELSE
///Biasanya Switch Statement dipasangkan dengan Enums
///Dan bentuknya lebih rapih dibandingkan IF / ELSE Statement

///Deklarasi Enum
enum Phone {
    case iPhone11Pro
    case iPhoneSE
    case pixel
    case nokia
}

///Switch Statement: pada Switch Statement semua Case harus di Handle
func getOpinion(on phone: Phone) {
    ///Switch the Value of Phone
    switch phone {
    case .iPhone11Pro:
        print("This will be my next phone.")
    case .iPhoneSE:
        print("I dislike this phone size. It makes design hard.")
    case .pixel:
        print("Hardware is great. Android is ewww")
    case .nokia:
        print("Can't be broken. Classic.")
    }
}

getOpinion(on: .iPhone11Pro)
getOpinion(on: .iPhoneSE)
getOpinion(on: .pixel)
getOpinion(on: .nokia)

//MARK: - ANOTHER EXAMPLE OF SWITCH STATEMENT (EXHAUSTIVE SWITCH CASE STATEMENT)
let matchMakingRank = 50

///Disini pada Switch Case Statement tidak ada Enum yang digunakan maka Switch Case Statement bisa Exhaustive dan membutuhkan Default Case
///Hal ini terjadi karena Switch harus menghandle seluruh kemungkinan Case yang bisa terjadi (Unlimited Possibility)
func determinePlayerLeague(from rank: Int) {
    switch rank {
    case 0:
        print("Play the game to determine your league")
    case 1..<50:
        print("You are in BRONZE League")
    case 50..<100:
        print("You are in SILVER League")
    case 100..<200:
        print("You are in GOLD League")
    default:
        print("You are in a league of your own. We don't know where you are")
    }
}

determinePlayerLeague(from: matchMakingRank)
