import UIKit
//Protocols pada Swift merupakan Objek Khusus (Special kind of Objects). Konsep dari Protocols adalah set of rules yang harus dilewati oleh masing-masing objek / variable.
///Biasanya Protocols itu digabungkan dengan Struct tapi juga bisa digunakan dengan Class, yang dimana Struct yang awalnya tidak memiliki sifat Inheritance. Tetapi dengan Protocols, struct seakan-akan memiliki sifat Inheritance.

//MARK: - SIMPLE EXAMPLE OF PROTOCOLS
///Biasanya protocols berisikan Function tanpa Body / Scope dari Function itu sendiri. Jadi hanya di Initilize saja tanpa implementasi scope / body dari function itu sendiri.
protocol CanBreathe {
    ///Objek apapun yang dapat dinyatakan "CanBreathe" harus memiliki function, yaitu breathe()
    func breathe() ///Rules: Breathe
}

///Disini Struct meng-inherit protocols CanBreathe, pada Struct yang meng-inherit ini harus dimasukkan Scope / Body Function breathe() karena ingat PROTOCOLS adalah Set of Rules.
struct Animal: CanBreathe {
    func breathe() {
        "Animal Breathing..."
    }
}

struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."
    }
}

///Cara memanggil Instances Protocols (cukup panggil Struct-nya)
let dog = Animal()
dog.breathe()

let deka = Person()
deka.breathe()

//MARK: - FUNCTION INSIDE PROTOCOL WITH EXTENSION
///Pada contoh sebelumnya, untuk bisa menggunakan Rules harus dideklarasikan satu persatu melalui Struct tetapi bisa juga di Deklrasikan sekali melalui Extension seperti contoh dibawah ini
protocol CanJump {
    func jump()
    
    ///Didalam Scope Protocols tidak bisa membuat Function pada Body / Scope, seperti dibawah ini:
    //func jump() {
        //"Jumping..."
    //}
}

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

///Pada posisi ini, instance tidak bisa dibuat berdasarkan extension diatas. Protocols baru bisa digunakan ketika sebuah objek / instances conform (melalui / melewati) protocols via Struct (uncomment dibawah ini untuk melihat errornya).
//let canJump = CanJump()
//canJump.jump()

///Pada struct cukup Inherit extension-nya kemundian, Scope dari Struct bisa dikosongkan
struct Cat: CanJump {
    ///Function pada Extension CanJump bisa di Override dengan cara menulis ulang function jump() di Struct ini:
    func jump() -> String {
        "Melompat"
    }
}

struct Human: CanJump {
    
}

///Cara memanggil Instances Protocols (cukup panggil Struct-nya)
let whisker = Cat() ///Test override jump() function via Struct
whisker.jump()

let humans = Human()
humans.jump()

//MARK: - DEFINING VARIABLES INSIDE PROTOCOLS
///Rules dalam mendeklarasikan variable didalam Protocols, dilakukan dengan cara seperti ini:
protocol HasName {
    ///Pada protocols deklarasi variable jika ingin variable tersebut dianggap "Read-Only" gunakan "get" as getter
    var name: String { get } ///Read-Only Immutable Variable
    ///Jika ingin variable tersebut bisa untuk "Read & Write" yang bersifat Mutable maka gunakan "get set" as getter and setter
    ///Penulisan diatas sebenarnya setara dengan penulisan seperti dibawah ini, hanya saja code dibawah ini tidak bisa dideklarasikan pada Scope Protocols (uncomment code below to show the error)
    //let name: String
    var age: Int { get set } ///Read & Write Mutable Variable
}

///Adding Another Function with Extension
extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old."
    }
}

///Cara memanggil Protocols dengan Variables diatas
struct Dog: HasName {
    ///By default "Swift Auto Fix Error" akan mendeklarasikan code dibawah ini "var name: String", tetapi code diatas "name" di set sebagai getter (Read-Only)
    ///Maka kita harus memperbaikinya secara manual dan ganti var menjadi let, seperti dibawah ini:
    let name: String
    var age: Int
}

///Apabila ada salah satu Variable diatas yang bersifat Mutable (getter & setter) seperti "age" maka sebaiknya gunakan Deklarasi var seperti dibawah ini:
var woof = Dog(name: "Woof", age: 10)
woof.name
woof.age
woof.age += 1
woof.age
woof.describeMe()

//MARK: - PROTOCOLS MUTATING FUNCTION
///Sama seperti Function biasa Mutating Function harus dideklarasikan didalam protocol tanpa Body / Scope dari Function itu sendiri. Jadi hanya di Initilize saja tanpa implementasi scope / body dari function itu sendiri.
protocol Vehicle {
    var speed: Int { get set }
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value: Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    
    init() {
        self.speed = 0
    }
}

///Apabila ada salah satu Variable diatas yang bersifat Mutable (getter & setter) seperti "speed" maka sebaiknya gunakan Deklarasi var seperti dibawah ini:
var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed

//MARK: - PROTOCOLS AS CONFORMANCES WITH "is"
///Inherit the Vehicle Protocols above
struct Motorcycle: Vehicle {
    var speed: Int
}

///Checking / Conform and object is PART of Vehicles Protocols (?) with "is"
///Any merupakan arti dari Any Object (very low object type)
///"is" doesn't promote the Vehicle Protocol variable, so it cannot accessing the variable of speed and the mutating function
func describe(obj: Any) {
    if obj is Vehicle {
        "obj conforms to the Vehicles protocol."
    } else {
        "obj does NOT conform to the Vehicles protocol."
    }
}

///Cara memanggil Protocol
var motorcycle = Motorcycle(speed: 30)
describe(obj: motorcycle)
///Uncomment the code Below and Comment the Code Above to Proves that Dog is Not an object that conforms the Vehicles Protocols
///The reason because dog is assign to Animal Protocols (Scroll Up the Animal Struct Above) not Vehicles
//describe(obj: dog)

//MARK: - PROTOCOLS AS PROMOTOR WITH "as?"
///Promotor meaning the object of vehicle as Any Object is Promoted to Vehicle Protocols so the vehicle object can accessing the variable of speed and the mutating function.
///"as?" is optional promotor that asking the object "is it a Vehicle?"
///If It IS then it CAN access the variables within the Vehicle Protocol.
///If it IS NOT then it CANNOT accessing the variables within the Vehicle Protocol.
func increaseSpeedIfVehicles(obj: Any) {
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "This was not a vehicle."
    }
}

///Remember the Protocols is Value Type not Reference Type because the Declaration above is Struct not Class
///This is Why the motorcycle.speed is still 30 as a default value because it doesn't store the increaseSpeed result within the function of increaseSpeedIfVehicles
///But if we change the Struct of Motorcycle: Vehicle and Add default value inside variable speed above to class then the motorcycle.speed would be 40
increaseSpeedIfVehicles(obj: motorcycle)
motorcycle.speed
