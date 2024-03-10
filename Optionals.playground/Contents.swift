import UIKit
//Optionals merupakan kemampuan sebuah code untuk menghandle nil value (the absence of value)
///Pada bahasa pemrograman Swift nil value harus di Unwrap dengan Optional
///Sehingga pada konsep Optional kita harus menuliskan kode untuk 2 case:
///1. Ketika MEMILIKI VALUE
///2. Ketika TIDAK MEMILIKI VALUE (nil value)
 
///Concept of Optional: Imagine you have a box, but you don't know whats inside that box until you "Unwrap" the box
///**The box can have something or it can't have anything**
///**So if we expect the box always have something, but ended up don't have anything means the apps not going to behave correctly  / crashed**
///Therefore, we need to handle that with Optionals

//MARK: - EXAMPLE OF OPTIONALS
//var ages: [Int] = [21, 45, 18, 17, 44, 23, 60] //Has a value
var ages: [Int] = [] //Has no Value
ages.sort() //Sorting value dari array ages berdasarkan value-nya

//3 Ways to Unwrap the Optional
///1. IF LET CONCEPT = **you have to code 2 cases with IF LET / ELSE CONDITIONAL**
///**The First case** handle a value within the "box".
///**The Second case** handle the nil value within the "box"
///if ages.last has a value (not nil), then unwrap the optional and give the value in it a name called oldestAge or storing in the variable (we can only use the oldestAge within the scope of IF LET)
///else, if the ages.last has no value (nil), then unwrap the optional and do something in the scope of ELSE (cannot use the variable of oldestAge)
if let oldestAge = ages.last {
    print("The oldest age is \(oldestAge)")
} else {
    print("There is no oldest age. You must have no students.")
}

///2. NIL COALESCING: **you have to give a default value if the value is nil**
///if the ages.last has a value (not nil), give the value in it a name called oldestAge or storing in the variable (we can only use the oldestAge within the scope of IF LET)
///else, if the ages.last has no value (nil), then unwrap the optional  and give the nil value of a default value (in this case is 21, and cannot use the variable of oldestAge)
let oldestAge = ages.last ?? 21

///3. GUARD STATEMENT is **a function because has to return something (has early exit) if only the value is nil**
///Benefit using Guard Statement is we can clean up code and core concept of Swift (MUST LEARN DEEPER)
///if the ages.last has a value (not nil), then unwrap the optional and give the value in it a name called oldestAge or storing in the variable (we can only use the oldestAge within the scope of IF LET)
///else, if the ages.last has no value (nil), then unwrap the optional and just "return" nothing (stop / get out from the function, and cannot use the variable of oldestAge)
func getOldestAge() {
    guard let oldestAge = ages.last else {
        return
    }
    print("\(oldestAge) is the oldest ages.")
}

///4. FORCE UNWRAP (NOT RECOMMENDED) = **Using exclamation mark (!), very dangerous way to Unwrap the Optional can cause the Apps to Crash**
///This code below, means "i don't care what's in the box, just use it no matter what"
///This way is always expected the "BOX" always has a value but when we use and it has no value (nil value) that's going to crash the app
let theOldestAge = ages.last! ///Resulting an error if because the ages is empty array (declaration above)

//MARK: - PERBEDAAN IF LET DENGAN GUARD STATEMENT
///1. IF LET hanya memberikan akses / scope apabila suatu Variable memiliki Value hal ini memberikan kemungkinan terjadinya Pyramid of Doom (tumpukan dari IF LET ELSE CONDITIONAL)
///2. sementara itu, GUARD STATEMENT memberikan akses / scope pada Function apabila suatu Variable memiliki Value, memberikan kesempatan untuk early exit apabila suatu Variable bernilai nil value, dan cleans up your code. Sehingga menghindari terjadinya Pyramid of Doom
