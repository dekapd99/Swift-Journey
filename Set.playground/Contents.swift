import UIKit

//Set: Collection of Items (Mirip dengan Array)
///Set = Unordered (tidak berurutan) berbeda dengan Array yang bersifat Ordered by Index (berurutan berdasarkan index)
///Set tidak bisa memiliki Value yang sama (Unique); No duplicate value
///Set lebih cepat secara perfomance dibandingkan Array (Faster Insertion, removal, dan constant time lookup)
///Set itu Hashable (identifier / direct pointer)

//MARK: - PERBEDAAN SET DAN ARRAY
var agesSet: Set<Int> = [] //Set: Declaration by Default
var ages = [18, 12, 35, 55, 12, 18] //Array

var setByExistingArray = Set(ages) //Set: data pada Set bisa didapat pada data didalam Array
print(setByExistingArray)
///Hasil output hanya [55, 12, 35, 18] tidak ada Value yang Sama (No duplicate value)
///Setiap di Code print diatas di eksekusi maka akan menghasilkan urutan / order yang berbeda (tidak berurutan berdasarkan insialisasi)

///Cek Hashable, dengan built in function .contains()
setByExistingArray.contains(17) //Cek, apakah value 17 ada didalam Set?
setByExistingArray.contains(12) //Cek, apakah value 12 ada didalam Set?
///Pembuktian diatas merupakan bagian dari Constant Time Lookup (mengecek secara satu persatu dari setiap value yang ada pada Set)
///Constant Time Lookup = Waktu yang digunakan untuk mencari Value tertentu dalam sebuah Set akan sama tidak peduli berapa besar ukuran Data-nya. Apabila ada Data berisikan 100.000 Items akan memakan waktu yang sama jika data hanya ada 10 Items.

//Manipulasi pada Set
setByExistingArray.insert(100) ///Menambahkan data pada Set dengan Urutan yang Unordered
print(setByExistingArray)
