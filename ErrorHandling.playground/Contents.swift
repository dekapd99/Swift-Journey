import UIKit
import Foundation

//Error Handling merupakan salah satu konsep terpenting dalam Programming Language manapun
//Kegunaan dari Error Handling adalah untuk memberikan deskripsi sebuah error yang terjadi apabila ada sesuatu yang salah dari Code / Function yang telah dibuat
//Error Handling dapat di definisikan dengan kata "throws"

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
