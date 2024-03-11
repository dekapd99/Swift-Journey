import UIKit
//Inheritance merupakan bagian dari konsep Object Oriented Programming (OOP) dan bagian dari Class.
///Inheritance biasanya digunakan pada Subclass yang memperoleh penurunan sifat / attribut dari Parent Class-nya.

//MARK: - CLASS EXAMPLE: EMPTY / OPTIONAL PROPERTIES
class Developers {
    var name: String?
    var jobTitle: String?
    var yearsExp: Int?
    
    ///Class Initializer yang Parameternya berisikan Properties diatas
    ///Scope dari Class Initializer merupakan Value dari masing-masing Parameter / Properties diatas
    init(name: String, jobTitle: String, yearsExp: Int) {
        ///Bisa dilihat ada 2 variable dengan penamaan yang sama seperti dibawah ini
        ///1. Warna Hijau merupakan Properties yang di deklarasikan diatas
        ///2. Warna Putih merupakan passing value yang bisa berupa dynamic input value atau default value
        ///Pada case ini Warna Putih merupakan Dynamic Input Value
        self.name = name
        self.jobTitle = jobTitle
        self.yearsExp = yearsExp
    }
    
    ///Function dapat dideklarasikan didalam Class seperti dibawah ini:
    func speak() {
        ///Force Unwrap (Not good Practice) tapi hanya sebagai contoh saja untuk mempermudah print
        print("Nama Saya \(name!), saya bekerja sebagai \(jobTitle!) yang berpengalaman selama \(yearsExp!) tahun.")
    }
}

///Cara Menggunakan Class (EMPTY / OPTIONAL PROPERTIES) dapat dilakukan dengan mendeklarasi variable / object baru
let employee = Developers(name: "Deka", jobTitle: "iOS Developer", yearsExp: 2)

///Cara memanggil Class
employee.name
employee.jobTitle
employee.yearsExp

employee.speak()

//MARK: - SUBCLASS (INHERITANCE) FROM THE CLASS OF DEVELOPERS ABOVE
///Secara konsep, maka subclass iOSDevelopers akan memiliki Properties dan Function yang sama seperti yang ada di Class Developers
class iOSDevelopers: Developers {
    var favoriteFramework: String?
    
    func speakFavoriteFramework() {
        ///Warna Hijau merupakan Properties yang di deklarasikan diatas
        ///Warna Putih merupakan Variable baru (Storing / Passing Value of favoriteFramework above)
        ///If let favoriteFramework (Hijau) has a value (not nil), then print the new variable of favoriteFramework (Putih)
        ///else, if favoriteFramework (Hijau) has no value (nil), then print the Scope of ELSE CONDITION
        if let favoriteFramework = favoriteFramework {
            print(favoriteFramework)
        } else {
            print("I don't have a favorite framework.")
        }
    }
    
    ///Override Function berguna untuk memodifikasi Function dari Parent Class diatas, sehingga function bisa berubah dan berbeda dari Parent Class-nya
    override func speak() {
        print("\(name!) - \(jobTitle!) - \(yearsExp!)")
    }
}

///Cara memanggil Subclass yang meng-inherit Parent Classnya (Developers)
let iOSDevs = iOSDevelopers(name: "Deka", jobTitle: "iOS Engineer", yearsExp: 2)
iOSDevs.favoriteFramework = "ARKit" ///Fleksibilitas Input dari Function diatas
iOSDevs.speakFavoriteFramework()
iOSDevs.speak()
