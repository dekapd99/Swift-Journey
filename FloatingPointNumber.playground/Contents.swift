import UIKit

//MARK: - FLOATING POINT NUMBER
///Angka floating-point adalah angka dengan komponen fraksional, seperti 3.14159, 0.1, dan -273.15.
///Floating-point di representasikan dengan tipe data Double dan Float

let nilai = 7.5 ///Swift secara otomatis mengintepretasikan ini adalah Float
let berat: Double = 55.5
let tinggi: Float = 165.2

//MARK: - Floating Bound
//Floating Bound untuk Seluruh tipe bit
let minValueFloat32 = Float32.leastNormalMagnitude
print("minValue sama dengan \(minValueFloat32), dan bertipe Float32")
let maxValueFloat32 = Float32.greatestFiniteMagnitude
print("maxValue sama dengan \(maxValueFloat32), dan bertipe Float32")

let minValueFloat64 = Float64.leastNormalMagnitude
print("minValue sama dengan \(minValueFloat64), dan bertipe Float64")
let maxValueFloat64 = Float64.greatestFiniteMagnitude
print("maxValue sama dengan \(maxValueFloat64), dan bertipe Float64")

let minValueDouble = Double.leastNormalMagnitude
print("minValue sama dengan \(minValueDouble), dan bertipe Double")
let maxValueDouble = Double.greatestFiniteMagnitude
print("maxValue sama dengan \(maxValueDouble), dan bertipe Double")
