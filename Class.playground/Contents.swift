import UIKit
//Class merupakan bagian dari Object Oriented Programming (OOP), yaitu konsep Abstact Class sebagai Object
///Object bisa memiliki Properties dan Function yang harus di "Intialized"
///Jadi tanpa "Intializer" Class tidak dapat digunakan

//MARK: - SIMPLE CLASS EXAMPLE
class Developer {
    var name: String
    var jobTitle: String
    var yearsExp: Int
    
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
        print("Nama Saya \(name), saya bekerja sebagai \(jobTitle) yang berpengalaman selama \(yearsExp) tahun.")
    }
}

///Cara Menggunakan Class dapat dilakukan dengan mendeklarasi variable / object baru
let employee = Developer(name: "Deka", jobTitle: "iOS Developer", yearsExp: 2)

employee.name
employee.jobTitle
employee.yearsExp

employee.speak()

//MARK: - CLASS EXAMPLE: EMPTY / OPTIONAL PROPERTIES
class Developers {
    var name: String?
    var jobTitle: String?
    var yearsExp: Int?
    
    ///Jika Properties pada Class dalam bentuk Optional maka harus di Initilize dengan konsep seperti dibawah ini:
    init() {}
    ///Init yang memiliki tidak memiliki Parameter / Property dapat memberikan Fleksibilitas untuk menginput value tertentu
}

///Cara Menggunakan Class (EMPTY / OPTIONAL PROPERTIES) dapat dilakukan dengan mendeklarasi variable / object baru
let employeeDevs = Developers()

///Dibawah ini merupakan bentuk Fleksibilitas dari Class (EMPTY / OPTIONAL PROPERTIES) sehingga dapat di deklarasikan dalam bentuk Variable / Object baru
employeeDevs.name = "Deka"
employeeDevs.jobTitle = "Data Analyst"
employeeDevs.yearsExp = 1
