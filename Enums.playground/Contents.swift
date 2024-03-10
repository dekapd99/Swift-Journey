import UIKit
//Enums merupakan kumpulan value yang saling berelasi (Group of Values that are related)
///Kegunaan Enum lainnya adalah menghindari penggunaan String Type yang berkepanjangan agar aplikasi tidak Crash karena Typo String / Kesalahan penulisan pada String (hal ini disebut dengan Stringly-Typed)

///Deklarasi Enum pada umumnya seperti ini
enum Phone {
    case iPhone11Pro
    case iPhoneSE
    case pixel
    case nokia
}

///Atau bisa dilakukan dalam 1 Line juga, seperti ini
enum Smartphone {
    case iPhone11Pro, iPhoneSE, pixel, nokia
}

///Biasanya Enum digunakan didalam Function seperti dibawah ini
func getOpinion(on phone: Phone) {
    if phone == .iPhone11Pro {
        print("This will be my next phone.")
    } else if phone == .iPhoneSE {
        print("I dislike this phone size. It makes design hard.")
    } else if phone == .pixel {
        print("Hardware is great. Android is ewww")
    } else {
        print("Can't be broken. Classic.")
    }
}

getOpinion(on: .iPhone11Pro)
getOpinion(on: .iPhoneSE)
getOpinion(on: .pixel)
getOpinion(on: .nokia)

//MARK: - Raw Value Enums
///Function diatas mungkin terlihat berantakan karena didalam IF / ELSE statement terlalu banyak String
///Hal tersebut bisa di Handle dengan Raw Value Enums seperti dibawah ini

//RAW VALUE of ENUMS
///This below means:  each Phones has a Raw Value of Strings
enum Phones: String {
    case iPhone11Pro = "This will be my next phone."
    case iPhoneSE = "I dislike this phone size. It makes design hard."
    case pixel = "Hardware is great. Android is ewww"
    case nokia = "Can't be broken. Classic."
}

func getPhonesOpinion(on phone: Phones) {
    print(phone.rawValue)
}

getPhonesOpinion(on: .iPhone11Pro)
getPhonesOpinion(on: .iPhoneSE)
getPhonesOpinion(on: .pixel)
getPhonesOpinion(on: .nokia)
