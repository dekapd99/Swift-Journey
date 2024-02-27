import UIKit

//MARK: - TYPE SAFETY & TYPE INFERENCE
///Swift merupakan salah satu bahasa pemrograman type-safe.
///Artinya Swift akan secara otomatis menentukan variable / konstanta berdasarkan penulisannya dan tipe data yang ada.
///Swift juga memastikan apabila terdapat ambiguitas dalam penulisan variable / konstanta maka Swift akan mengeluarkan pesan Error

let umur = 42 ///Swift menyimpulkan bahwa konstanta ini memiliki tipe data Integer
print("\(type(of: umur))")

//MARK: - TYPE CHECKING
///type-checking berfungsi untuk menghindari kesalahan saat bekerja dengan berbagai jenis tipe data yang berbeda. Sehingga tidak perlu menuliskan  tipe datanya.
///Swift akan mencari toleransi tertinggi misalkan Float vs Double, Swift secara otomatis akan memilih Double dibandingkan Float
let pi = 3.14 ///Swift menyimpulkan bahwa konstanta ini memiliki tipe data Double (bukan Float karena float lebih kecil)
print("\(type(of: pi))")

//MARK: - TYPE INFERENCE
///Type inference memungkinkan kompiler menyimpulkan tipe data tertentu secara otomatis saat proses kompilasi dilakukan.
///Seperti contoh diatas juga mengandung konsep Type Inference, dan Swift juga bisa memprediksi Tipe Data seperti dibawah ini
let anotherPi = 3 + 0.14159 ///Swift memprediksi bahwa konstanta ini memiliki tipe data Double (bukan Integer)
print("\(type(of: anotherPi))")

///Dalam kode tersebut sebuah nilai literal 3 tidak memiliki tipe data secara eksplisit. Swift akan memprediksi tipe datanya adalah Int. Namun jika Anda lihat nilai literal selanjutnya adalah 0.14149, artinya itu adalah double. Oleh karena itu, Swift akan menyimpulkan bahwa tipe data dari output adalah double.
