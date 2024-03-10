import UIKit
//Operators merupakan bentuk perhitungan dengan operator Matematika
///Menghandle perintah penjumlahan, perkalian, pengurangan, modulus (sisa), pembagian
///Operator juga menghandle perintah pengecekan kondisi
///Jenis Operator: ! ||  < > <= >= == && + -  / *

//MARK: - MATH OPERATORS
let valueOne = 55
let valueTwo = 31

let sum = valueOne + valueTwo
let substraction = valueOne - valueTwo
let multiplication = valueOne * valueTwo
let modulus = valueOne % valueTwo

///Pada Pembagian dibawah ini akan menghasilkan 1 seharusnya menghasilkan Tipe Data Float / Double karena hasilnya seharusnya dalam bentuk angka Fraksi bukan angka Bulat
///Hal ini terjadi karena Tipe Data Deklarasi dari valueOne dan valueTwo adalah Integer bukan Float / Double sehingga Hasil Fraksi akan di Drop Decimalnya / Fraksinya
let division = valueOne / valueTwo

//Sehingga harus dilakukan seperti ini menggunakan Tipe Data yang Sama tanpa Type Inference
let nilaiPertama: Double = 55
let nilaiKedua: Double = 88
let pembagian = nilaiPertama / nilaiKedua

//MARK: - EQUAL SIGN OPERATORS
///One Equal Sign (=) merupakan Assignment Operator
let angkaPertama = 5 ///Contoh One Equal Sign atau seperti diatas
let angkaKedua = 10

///Two Equal Sign (==) merupakan Pengecekan (is this value equals to that value?)
angkaPertama == angkaKedua ///Contoh Two Equal Sign
angkaPertama == angkaPertama ///Contoh Two Equal Sign

//Another Example of Equal Sign
if angkaPertama == angkaKedua {
    print("The are Equal")
}

//Bang Sign Operators (!)
if angkaPertama != angkaKedua {
    print("The are Not Equal")
}

var isDarkModeOn = true

///The Condition below = Cek apakah Darkmode Tidak Menyala? Jika Menyala maka ...
if !isDarkModeOn {
    print("It's so bright in here.")
}

var darkModeIsOn = false

///The Condition below = Cek apakah Darkmode Tidak Menyala? Jika Menyala maka ... Jika Tidak Print ...
if !darkModeIsOn {
    print("It's so bright in here.")
}

//MARK: - COMPARISONS SIGN OPERATORS (GREATER & LESS THAN)
let kuotaPertama = 100
let kuotaKedua = 50

if kuotaPertama >= kuotaKedua {
    print("Nilai Kuota Pertama Lebih besar dari Nilai Kuota Kedua")
}

//MARK: - MULTIPLE CONDITION ( || &&)
///Multiple Condition (2 Kondisi harus terpenuhi agar code bisa tereksekusi)
if kuotaPertama >= kuotaKedua && kuotaPertama >= 80 {
    print("Selamat Perfoma Kinerja Anda Meningkat!")
}

///Multiple Condition (Salah Satu Kondisi harus terpenuhi agar code bisa tereksekusi)
if kuotaPertama >= 80 || kuotaKedua >= 80 {
    ///Kondisi yang terpenuhi adalah kuotaPertama >= 80
    print("Selamat Perfoma Kinerja Anda Meningkat!")
}

if kuotaPertama >= 100 || kuotaKedua >= 100 || isDarkModeOn {
    ///Kondisi yang terpenuhi adalah isDarkModeOn
    print("Selamat Perfoma Kinerja Anda Meningkat!")
}

//MARK: - INCREMENT / DECREMENT OPERATORS ( += -= )
var counter = 5

counter += 1
counter -= 2 ///Hasilnya 4 karena dari hasil Increment pertama diatas adalah 6 kemudian dikurangi 2 maka = 4

//MARK: - COMBINE STRINGS AND ARRAY TOGETHER WITH (+)
let greeting = "Hello"
let name = "Deka"

print(greeting + " " + name)

let agesYoung = [3, 6, 9]
let agesOld = [50, 61, 45]

let allAges = agesOld + agesYoung
print(allAges)
