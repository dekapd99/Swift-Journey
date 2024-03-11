import UIKit
import Foundation
//Closures merupakan bagian dari Function yang bersifat Khusus dengan Local Variables / Function yang dibuat dalam 1 baris code yang sama.

///Arti code ini adalah sebuah variable "sum" akan menerima 2 variable Int melalui "(Int, Int)"
///Nama variable pertama adalah num1, dan variable kedua adalah num2 dan akan menghasilkan Integer "-> Int"
let sum: (Int, Int) -> Int = { (num1: Int, num2: Int) -> Int in
    num1 + num2
}

///Cara memanggil Closures diatas
sum(20, 30)

//MARK: - MORE COMPLEX CLOSURE (CLOSURE USING A FUNCTION)
///In this case, the closure is accessing a function by adding a closures in parameter
///Look closely in the parameter there is a closures name function with using as a label name
///Closures code: using function: (Int, Int) -> Int
func customSum(_ num1: Int,
               _ num2: Int,
               using function: (Int, Int) -> Int) -> Int {
    function(num1, num2)
}

///Trailling Closure Syntax
///The original is customSum(<#T##num1: Int##Int#>, <#T##num2: Int##Int#>, using: <#T##(Int, Int) -> Int#>), then just tap "enter" / "return" in keyboard in the "using" to make it Trailling Closure Syntax
customSum(10, 20) { (num1: Int, num2: Int) -> Int in
    num1 + num2
}

///We can also clean the code above by removing the Data Type and Return Type
customSum(10, 20) { (num1, num2) in
    num1 + num2
}

///We can also make it more cleaner by removing the (num1, num2) in, and Change the num1 & num2 to Dollar Sign $0 and Dollar Sign $1
customSum(10, 20) { $0 + $1 }

///Note: But when we are having a big project sometimes we forget what kind Return Type that Swift needs to returns
///and Also it would take so much time for swift to Figure Out the Trailling Closure Syntax, if you are not Speficifying the Data Type
///So the Best Practice for those conditional is don't clean the Code, use the First One

///You can also put the Closures in the First of the Parameter like this
func customAdd(using function: (Int, Int) -> Int,
               _ num1: Int,
               _ num2: Int) -> Int {
    function(num1, num2)
}

///But the code would look like dirtier like this
customAdd(using: { (num1: Int, num2: Int) -> Int in
    num1 + num2
}, 5, 2)

//MARK: - SPECIAL CLOSURES
let ages: [Int] = [30, 20, 19, 40]
///Descending if num1 > num2&  Ascending if num1 < num2
ages.sorted(by: {(num1: Int, num2: Int) -> Bool in
    num1 < num2
})
