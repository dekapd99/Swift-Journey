import UIKit

//Array juga bisa Type Inference (Auto Data Type by Swift)
///Array merupakan bagian dari Collection of Items (Data Type)
///Array = Ordered (berurutan)
///Array bisa memiliki Value yang Sama (Duplicate Data / Value)
///Array memilik perfomance yang lambat dibandingkan seluruh Collection of Items Data Type (Set, Dictionary, Array)
var age = [21, 55, 19, 47, 22, 37, 88, 71]
var ages: [Int] = [21, 55, 19, 47, 22, 37, 88, 71] ///Bentuk ini sama dengan bentuk diatas

///Jika menginginkan Empty Array harus ditentukan Tipe Datanya terlebih dahulu seperti dibawah ini
var umur: [Int] = []

ages.count ///Menghitung jumlah index dalam array
ages.first ///Menampilkan value dari array index 0
ages.last ///Menampilkan value dari array index terakhir
ages[3] ///Substracting Index (mengambil salah satu urutan index)

//Memanipulasi Array
///Menambahkan data baru pada Array
ages.append(99)
print(ages)

///Menambahkan data baru pada Array pada index tertentu (case index = 0)
ages.insert(44, at: 0)
print(ages)

///Sorting Array berdasarkan urutan angka (Tergantung pada Tipe Data)
ages.sort()
print(ages)

///Reverse order berdasarkan data diatas dan manipulasi data diatas (membalikkan index order mulai dari belakang ke depan)
ages.reverse()
print(ages)

///Shuffling Value of Array by random
ages.shuffle()
print(ages)
