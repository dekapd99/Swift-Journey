import UIKit
//Dictionary merupakan Collection of Items yang mirip dengan Array & Set
///Dictionary memiliki Key Value (key: value)
///Titik 2 (:) / Colon merupakan pemisah antara Key dengan Value
///Perfomance Dictionary sama dengan Set memiliki sifat (Constant Time Lookup)

///Deklarasi Default dari Dictionary [key: value] => [String: String]
let devices: [String: String] = [
    "phone": "iPhone 14",
    "laptop": "Macbook Air M1",
    "tablet": "iPad Pro",
    "desktop": "iMac Pro"
]

devices["laptop"] ///Constant Time Lookup
devices["phone"] ///Constant Time Lookup


//Contoh Lain yang lebih Advance Dictionary dalam Struct
struct Developer {
    let name: String
    let jobTitle: String
    let devices: [String: String]
}
