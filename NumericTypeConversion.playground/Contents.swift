import UIKit

//MARK: - INTEGER CONVERSION
///Ketika Anda menggunakan tipe data integer (Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64), tentu ada batasan memory yang akan digunakan.
///Contoh Int8 hanya dapat menyimpan angka antara -128 sampai 127 (tidak bisa lebih).
///Contoh UInt8 hanya dapat menyimpan angka 0 sampai 255 (tidak bisa menyimpang angka negatif).

//MARK: - Contoh Kesalahan Menyimpang Tipe Integer (4 Line code dibawah ini Harus di uncomment)
//let cannotBeNegative: UInt8 = -1
//// UInt8 tidak dapat menyimpan angka negatif, dan akan menyebabkan error.
//let tooBig: Int8 = Int8.max + 1
//// Int8 tidak dapat menyimpan sebuah angka yang lebih besar dari nilai maksimumnya, dan akan menyebabkan error.

//MARK: - Menghitung 2 tipe integer yang berbeda dengan cara Konversi tipe Integer
///Operasi perhitungan dibawah ini tidak bisa dilakukan tanpa konversi
let twoThousand: UInt16 = 2_000 //Tipe unsigned integer 16
let one: Int8 = 1 //Tipe Integer 8
let twoThousandAndOne = twoThousand + UInt16(one)
print(twoThousandAndOne)

//MARK: - Integer and Floating-Point Conversion
let three = 3 //Tipe data Integer
let pointOneFourOneFiveNine = 0.14159 //Tipe data Double
let pi = Double(three) + pointOneFourOneFiveNine //Konversi Integer menjadi Double
print("Nilai pi adalah \(pi), dan ini di definisikan menjadi tipe Double.")

//MARK: - Floating-Point Conversion to Integer
///Perlu diketahui apabila Floating-Point number dikonversi menjadi Integer maka akan dibulatkan kebawah secara default
let two = 2
let floatingPoint = 0.15
let totalConversion = Double(two) + floatingPoint
let floatingToInteger = Int(totalConversion)
print("integerPi memiliki nilai \(floatingToInteger) dan ia didefinisikan memiliki tipe Int.") ///Hasil 2,15 dibulatkan kebawah menjadi 2
