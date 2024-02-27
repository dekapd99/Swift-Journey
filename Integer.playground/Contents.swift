import UIKit

//MARK: - INTEGER (TIPE DATA)
///Integer merupakan bilangan bulat tanpa komponen fraksional seperti 42 dan -32. 
///Integer terdiri dari dua tipe, signed (bernilai positif, nol, atau negatif) dan unsigned (hanya bernilai positif atau nol).
let angka: Int = 17

///Swift mendukung integer untuk signed dan unsigned dalam bentuk 8-bit, 16-bit, 32-bit, dan 64-bit.
///Integer mengikuti konvensi penamaan yang mirip dengan bahasa C, di mana integer dalam bentuk 8-bit unsigned akan bertipe UInt8 dan 32-bit signed akan bertipe Int32.
///Seperti halnya semua tipe data lain Swift, integer memiliki nama dengan huruf kapital/besar, yakni Int.

//MARK: - Integer Bound
///Cara mengakses nilai minimum dan maximum dapat menggunakan properti min dan max
let minValue = UInt8.min
print(minValue) // minValue is equal to 0, and is of type UInt8
let maxValue = UInt8.max
print(maxValue) // maxValue is equal to 255, and is of type UInt8

//Integer Bound untuk Seluruh tipe bit
let minValueInt8 = Int8.min
print("minValue sama dengan \(minValueInt8), dan bertipe Int8")
let maxValueInt8 = Int8.max
print("maxValue sama dengan \(maxValueInt8), dan bertipe Int8")

let minValueInt16 = Int16.min
print("minValue sama dengan \(minValueInt16), dan bertipe Int16")
let maxValueInt16 = Int16.max
print("maxValue sama dengan \(maxValueInt16), dan bertipe Int16")

let minValueInt32 = Int32.min
print("minValue sama dengan \(minValueInt32), dan bertipe Int32")
let maxValueInt32 = Int32.max
print("maxValue sama dengan \(maxValueInt32), dan bertipe Int32")

let minValueInt64 = Int64.min
print("minValue sama dengan \(minValueInt64), dan bertipe Int64")
let maxValueInt64 = Int64.max
print("maxValue sama dengan \(maxValueInt64), dan bertipe Int64")

//MARK: - Unsigned Integer (UInt)
///Gunakan UInt hanya ketika butuh tipe unsigned integer dengan ukuran yang sama dengan jumlah kata dari sebuah platform. Jika tidak, maka gunakan Int ketika nilai angkanya positif.
let minValueUInt8 = UInt8.min
print("minValue sama dengan \(minValueUInt8), dan bertipe UInt8")
let maxValueUInt8 = UInt8.max
print("maxValue sama dengan \(maxValueUInt8), dan bertipe UInt8")


let minValueUInt16 = UInt16.min
print("minValue sama dengan \(minValueUInt16), dan bertipe UInt16")
let maxValueUInt16 = UInt16.max
print("maxValue sama dengan \(maxValueUInt16), dan bertipe UInt16")


let minValueUInt32 = UInt32.min
print("minValue sama dengan \(minValueUInt32), dan bertipe UInt32")
let maxValueUInt32 = UInt32.max
print("maxValue sama dengan \(maxValueUInt32), dan bertipe UInt32")

let minValueUInt64 = UInt64.min
print("minValue sama dengan \(minValueUInt64), dan bertipe UInt64")
let maxValueUInt64 = UInt64.max
print("maxValue sama dengan \(maxValueUInt64), dan bertipe UInt64")

//MARK: - CATATAN
///Penggunaan Int yang konsisten untuk setiap nilai integer akan membantu kode menjadi interoperabilitas, menghindari kebutuhan untuk konversi antara tipe angka yang berbeda, dan mencocokkan inferensi tipe integer.
