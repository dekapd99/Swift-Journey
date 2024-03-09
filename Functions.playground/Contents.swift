import UIKit
//Functions merupakan Set of Instruction
///Function biasanya berisikan Potongan Kode yang berhubungan dengan Bisnis Logic sebuah Project
///Bersifat Reusable dan biasanya harus dalam bentuk Kata Kerja (VERB)
///Cara menggunakan Function: 1. Define the Function 2. Then, use the Function

//Default Function
func printInstructorsName() {
    print("Sean Allen")
}

//Call or Use the Function above
printInstructorsName()

//Function with Parameters
func instructorsName(name: String, age: Int, nationality: String) {
    print(name)
}

//Call or Use the Function with Parameters Above
instructorsName(name: "Sean Allen", age: 25, nationality: "Canada")


//Simple Operator (Function Signature)
///to pada Parameter (Call Site) merupakan  Argumen Label (to) biasanya digunakan pada Swift untuk mempermudah membaca sebuah Function
func add(firstNumber: Int, to secondNumber: Int) -> Int {
    ///Bagian dibawah ini adalah Function Scope
    let sum = firstNumber + secondNumber
    return sum
}

//Call or Use the Function Signature above with Argumen Label (to)
add(firstNumber: 100, to: 200)

//Contoh lain Argumen Label
func penjumlahan(angkaPertama: Int, ditambah angkaKedua: Int) -> Int {
    let hasilPenjumlahan = angkaPertama + angkaKedua
    return hasilPenjumlahan
}

//Call or Use the Function Signature above with Argumen Label (ditambah)
///Argumen Label boleh ditulis apa saja seperti nama variable asalkan mudah untuk dibaca
penjumlahan(angkaPertama: 20, ditambah: 10)

