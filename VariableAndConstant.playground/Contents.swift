import UIKit

//MARK: - VARIABLES
///Variable  mampu menyimpan nilai yang dapat dimanipulasi oleh sebuah program (mutable).
var variable = "Hello, variable"
print(variable)

//MARK: - Annotation Type Variables (:)
///Annotation digunakan untuk menjelaskan tipe data pada Variable atau Konstanta
var name: String = "Deka" ///Sehingga name memiliki tipe data String
print(name)

//MARK: - Variable bersifat Mutable (Bisa berubah Valuenya)
var mutableString = "Hello!" ///Value var friendlyWelcome = Hello
mutableString = "Bonjour!" ///Value var friendlyWelcome berubah menjadi = Bonjour
print(mutableString)

//MARK: - Mencetak Konstanta dan Variabel (print) di Terminal dapat menggunakan prinsip code dibawah ini !
//func print(_ items: Any..., separator: String = " ", terminator: String = "\n")

//Fungsi print diatas memiliki 3 properties yang berbeda, yakni Items, Separator, dan Terminator !
///1. Property: Items = digunakan untuk memasukkan item yang akan dicetak, baik satu nilai atau lebih.
print(1, 2, 3, 4, 5) ///Mencetak hasilnya seperti biasa

///2. Property: Separator = digunakan sebagai pemisah antara item yang akan dicetak.
print(1.0, 2.0, 3.0, 4.0, 5.0, separator: "...") ///Terdapat pemisah antara value dengan ...

///3. Property: Terminator = digunakan untuk mencetak nilai akhir dari sebuah item.
for n in 1...5 {
    print(n, terminator: " ")
}

//MARK: - STRING INTERPOLATION
///String Inperpolation digunakan untuk membangun sebuah nilai string baru yang terdari dari konstanta, variabel, nilai literal, atau ekspresi dengan nilai string literal (static) di dalamnya.
var stringInterpolation = "Hello!"
stringInterpolation = "Bonjour!"
print("The current value of friendlyWelcome is \(stringInterpolation)")


//MARK: - CONSTANT
///Constant atau konstanta mampu menyimpan nilai yang bersifat tetap atau tidak dapat diubah selama proses eksekusi program. (Constant bersifat Immutable)
let country = "Indonesia"
country = "Malaysia" ///Output tidak bisa dicetak karena Let (Constant) bersifat Immutable / Value tidak bisa diubah
