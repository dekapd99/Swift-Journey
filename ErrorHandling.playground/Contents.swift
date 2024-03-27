import UIKit
import Foundation

//Error Handling merupakan salah satu konsep terpenting dalam Programming Language manapun
//Kegunaan dari Error Handling adalah untuk memberikan deskripsi sebuah error yang terjadi apabila ada sesuatu yang salah dari Code / Function yang telah dibuat
//Error Handling dapat di definisikan dengan kata "throws"

//Catatan: Berikut urutan cara yang ideal untuk melakukan Error Handling
//1. Do & Catch
//2. Unwrap Optional "If Let" + "Try?" Statement

//Jangan pernah melakukan Force Unwrap Error Handling dengan "Try!"

struct NameOfPerson {
    let firstName: String?
    let lastName: String?
}

///Bagaimana caranya kita bisa mendapatkan Nama Lengkap dari Person apabilan firstName dan lastName bisa saja punya nilai kosong (nil) karena hal tersebut Optional
///Tujuan dari Function dibawah ini adalah untuk mendapatkan String Fullname (Uncomment Function dibawah ini)

func personFullName() -> String {
    ""
}

///Cara terbaik untuk menggunakan Error Handling dalam konteks apapun adalah dengan cara Define didalam Enclosing Structure / Class (pada konteks ini, deklarasikan didalam Struct NameOfPerson). Kita buat ulang seperti dibawah ini:

//MARK: - ERROR HANDLING ABOVE
struct Person {
    let firstName: String?
    let lastName: String?
    
    ///Penamaan enum Error sebaiknya lebih Spesifik dan harus Conforms Error Protocol (Built-in Swift)
    ///Ketika kita mendefinisikan Error maka kita harus bisa mendefinisikan kemungkinan case terjadinya Error berdasarkan Input diatas
    enum PersonErrors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case bothNamesAreNil
    }
    
    func getFullName() throws -> String {
        ///Unwrapped the Optional Person Struct above with the Error Enums (Handling with Switch Case)
        ///Teknik dibawah ini disebut dengan Pattern Match
        switch (firstName, lastName) {
        case (.none, .none): ///Case kosong keduanya
            throw PersonErrors.bothNamesAreNil
        case (.none, .some): ///Case kosong firstName
            throw PersonErrors.firstNameIsNil
        case (.some, .none): ///Case kosong lastName
            throw PersonErrors.lastNameIsNil
        case let (.some(firstName), .some(lastName)): ///Case nama terisi
            return "\(firstName) \(lastName)"
        }
    }
}

//MARK: - ERROR DECLARATION
///Deklarasikan Namanya seperti dibawah ini
let name = Person(firstName: "Deka", lastName: nil)
///Cara memanggil Errornya harus menggunakan Try seperti dibawah ini apabila ada "throws" didalam Functionnya
///Apabila ditulis seperti dibawah ini (uncomment) Playground tidak akan jalan karena Crash
//let fullName = try name.getFullName()

///Untuk bisa menggunakan Try harus disertai dengan "do & catch" konteks
///"DO" untuk menjalankan pemanggilan Function-nya
///"CATCH" untuk menangkap Error-nya apabila ada salah satu Case Error yang terpenuhi
do {
    let fullName = try name.getFullName()
} catch {
    ///\(error) merupakan Internal Error Description yang disediakan oleh Swift
    "Got an Error = \(error)"
}

///CATATAN: Code diatas merupakan Catch untuk semua jenis Error bahkan kalau firstName = nil dan lastName = nil, maka akan menghasilkan konteks Error yang sama

//BAGAIMANA KALAU KITA INGIN "CATCH" ERROR YANG LEBIH SPESIFIK SESUAI DENGAN CASE-NYA?
//Dapat menggunakan Cara seperti dibawah ini:
do {
    let fullName = try name.getFullName()
} catch Person.PersonErrors.firstNameIsNil {
    "First Name is Nil"
} catch Person.PersonErrors.lastNameIsNil {
    "Last Name is Nil"
} catch Person.PersonErrors.bothNamesAreNil {
    "Both Names are Nil"
} catch {
    "Unknown Error"
}

//MARK: - ERROR HANDLING INSIDE CONSTRUCTORS / CLASS (DEFINE ERROR INITIALIZERS)
///Misalkan ada sebuah Struct tanpa Optional Data Type, apabila ada suatu kondisi / anomali error yang bisa membuat input tersebut Kosong maka kita harus Define Error-nya pada Intializers, seperti dibawah ini:
struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }
    
    ///Initializers untuk Error Handling ketika manufacturer = nil
    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        } else {
            self.manufacturer = manufacturer
        }
    }
}

///Lakukan Do & Catch Error seperti dibawah ini:
do {
    let myCar = try Car(manufacturer: "")
} catch Car.Errors.invalidManufacturer {
    "Invalid Manufacturer"
} catch {
    "Some other error..."
}

///Terkadang kita hanya ingin get Value dari Input tanpa memikirkan Catching Errornya
///Hal diatas dapat disimplifikasikan dengan menggunakan "if let" + "try?" tanpa harus menggunakan Do & Catch
///Cara membaca code dibawah ini:
///1. Deklarasikan yourCar
///2. Akses Function / Struct / Class Car() dengan Optional Error Handling "try?"
///3. Maksud dari "try?" adalah akses Struct Car() didalam parameter ini ada value-nya maka Get the Value
///4. Kalau tidak ada value-nya maka Throw Error seperti dibawah ini.
if let yourCar = try? Car(manufacturer: "Tesla") {
    "Success, your car is \(yourCar)."
} else {
    ///Hanya saja ketika didalam ini, kita kehilangan akses terhadap Error Object tapi tetap punya akses ke Error Enum diatas (Uncomment Code dibawah ini)
//    Errors.invalidManufacturer
//    Car.Errors.invalidManufacturer
    "Failed to construct and error is not accessible now."
}

//MARK: - FORCE UNWRAP A FUNCTION TO THROW AN ERROR -> try!
///Swift memperbolehkan "force unwrap a function to throw an error" hanya saja jangan pernah dilakukan karena bisa membuat Aplikasi kita menjadi Crash / Force Close menggunakan try!
///Uncomment Code dibawah ini, Error yang dihasilkan adalah Failed to Execute Program
///error: Execution was interrupted, reason: EXC_BREAKPOINT (code=1, subcode=0x18c985be8).
//let theirCar = try! Car(manufacturer: "")
//theirCar.manufacturer


//MARK: - ERROR HANDLING WITHOUT DO & CATCH WITH FUNCTION WRAPPING (THROWS MARK)
struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingErrors: Error {
        case cannotBarkIsSleeping
    }
    
    enum RunningErrors: Error {
        case cannotRunIsInjured
    }

    func bark() throws {
        ///Cannot Bark when it's Sleeping
        if isSleeping {
            throw BarkingErrors.cannotBarkIsSleeping
        }
        "Bark..."
    }
    
    
    func run() throws {
        ///Cannot Run when it's Injured
        if isInjured {
            throw RunningErrors.cannotRunIsInjured
        }
        "Run..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
}

let dog = Dog(isInjured: true, isSleeping: true)

///This Do & Catch here cannot Catch 2 Errors at the same time, but rather only Checking 1 of the 2 Errors
do {
    try dog.barkAndRun()
    dog
} catch Dog.BarkingErrors.cannotBarkIsSleeping,
        Dog.RunningErrors.cannotRunIsInjured {
    "Cannot Bark is Sleeping OR Cannot Run is Injured"
} catch {
    "Some other error"
}

//MARK: - FUNCTION THAT CAN CALL ANOTHER FUNCTION WHICH CAN CATCH ERROR INTERNALLY WITHIN THE FUNCTION

func fullName(firstName: String?, lastName: String?, calculator: (String?, String?) throws -> String?) rethrows -> String? {
    try calculator(firstName, lastName)
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (firstName: String?, lastName: String?) throws -> String {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let fooBar = try fullName(firstName: "Foo", lastName: "Bar", calculator: +)
} catch NameErrors.firstNameIsInvalid {
    "First name is invalid."
} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid."
} catch let err {
    "Some other error: \(err)"
}

//MARK: - RESULTS RELATED WITH ERROR HANDLING
///Useful when writing API Calls
enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}

performGet(forValue: 0)
performGet(forValue: 2)
