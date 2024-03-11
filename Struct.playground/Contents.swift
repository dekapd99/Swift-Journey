import UIKit
//Struct merupakan bagian dari konsep Object pada Swift Programming Language yang memiliki sifat Value Type
///Sifat Value Type pada Struct berarti ketika Struct digunakan untuk dimodifikasi Value-nya maka Value tersebut
///Akan dibuat Salinan-nya (Copy). Analogi-nya seperti File Microsoft Excel (Offline) yang ketika diganti isi File-nya,
///Sumber / Parent / Root dari File tersebut tidak berubah sama sekali.
///Berbeda dengan Class yang dapat diibaratkan dengan Google Sheet, ketika diganti maka File Sumber / Parent / Root-nya akan ikut berubah.
///Struct hanya ada di Swift, dan tidak ada di Objective-C

//MARK: - STRUCT EXAMPLE: EMPTY / OPTIONAL PROPERTIES
struct Developers {
    var name: String
    var jobTitle: String
    var yearsExp: Int
}

var employee = Developers(name: "Deka", jobTitle: "iOS Developer", yearsExp: 2)
var pegawai = employee ///Create a Copy of Employee then Assign it to Pegawai
pegawai.name = "Joe" ///Change the value of name Pegawai from Employee name of Deka to Joe
employee.name ///Tetapi hasil Outputnya disini Employee Name tetaplah Deka bukan Joe. Inilah Value Type

//MARK: - KAPAN HARUS MENGGUNAKAN STRUCTS ATAU CLASS?
///Class dapat digunakan ketika menghandle API dan ketika berhadapan dengan Objective-C
///Struct dapat digunakan kapan saja dimana Struct mampu menjadi default untuk kebutuhan deklarasi data.
///Struct pada Swift sangat powerful karena dapat menyimpan properties, computed properties, dan method / function. Struct juga hampir menyerupai Class melalui konsep "Conform to Protocols"-nya

//MARK: - PERBEDAAN STRUCT DENGAN CLASS
///Struct bersifat Light-Weight Perfomance dibandingkan Class
///Struct merupakan Value Types dan Class merupakan Reference Types
///Struct tidak perlu di initilize karena sudah secara otomatis di initialize (hal ini disebut dengan Memberwise-Intializer). Sementara itu, Class harus di initialize dengan init()
