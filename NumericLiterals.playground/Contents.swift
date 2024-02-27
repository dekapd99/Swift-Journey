import UIKit

//MARK: - NUMERIC LITERALS
//Numeric literal dapat ditulis dengan berbagai macam:
/**
 * Angka desimal, tanpa awalan.
 * Angka biner, dengan awalan 0b.
 * Angka oktal, dengan awalan 0o.
 * Angka heksadesimal, dengan awalan 0x.
 */

let decimalInteger = 18
print("Nilai decimalInteger adalah \(decimalInteger)")

let binaryInteger = 0b10010
print("Nilai binaryInteger adalah \(binaryInteger)")

let octalInteger = 0o22
print("Nilai octalInteger adalah \(octalInteger)")

let hexadecimalInteger = 0x12
print("Nilai hexadecimalInteger adalah \(hexadecimalInteger)")

///Ada juga penulisan angka Exponesial dengan kata kunci huruf kecil e (dikalikan 10) diantara angka decimal atau angka bulat
let integerExponen = 15e2
print("15e2 berarti 15 x 10 pangkat 2 atau \(integerExponen).")

let decimalExponen = 1.25e2
print("1.25e2 berarti 1.25 x 10 pangkat 2 atau \(decimalExponen).")

let anotherDecimalExponen = 1.25e-2
print("1.25e-2 berarti 1.25 x 10 pangkat -2 atau \(anotherDecimalExponen).")

///Eksponen juga bisa dikombinasikan dengan angka hexadesimal dengan kata kunci huruf kecil p (dikalikan 2) diantara angka decimal atau bulat
let hexadecimalExponen = 0xFp2
print("0xFp2 berarti 15 x 2 pangkat 2 atau \(hexadecimalExponen).")

let anotherHexadecimalExponen = 0xFp-2
print("0xFp-2 berarti 15 x 2 pangkat -2 atau \(anotherHexadecimalExponen).")


let decimalDouble = 12.1875
print("Berikut akan menghasilkan 12.1875 secara desimal = \(decimalDouble)")

let exponentDouble = 1.21875e1
print("Berikut akan menghasilkan 12.1875 secara eksponen = \(exponentDouble)")

let hexadecimalDouble = 0xC.3p0
print("Berikut akan menghasilkan 12.1875 secara hexadecimal = \(hexadecimalDouble)")

///Numeric Literals dapat berisikan beberapa tambahan komponen agar lebih mudah dibaca. Seperti Integer dan Float, dapat berisi tambahan nol dan garis bawah. Jenis format tidak akan mempengaruhi nilai dasar literal tersebut, contohnya seperti ini:
let paddedDouble = 000123.456
print("Berikut akan menghasilkan 123.456 = \(paddedDouble)")

let oneMillion = 1_000_000
print("Berikut akan menghasilkan 1.000.000 = \(oneMillion)")

let justOverOneMillion = 1_000_000.000_000_1
print("Berikut akan menghasilkan 1000000.0000001 = \(justOverOneMillion)")
