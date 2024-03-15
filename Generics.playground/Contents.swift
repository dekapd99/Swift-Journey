import UIKit
import Foundation
//Generics merupakan suatu metode / cara pada Swift untuk menghindari penulisan Code yang sama (Core value of Swift)

//MARK: - CONVENSIONAL FUNCTION (MEMBUAT FUNCTION SECARA SPESIFIK 1 PER 1)
///Function dibawah memiliki parameter operation yang menghandle 2 Integer Input / Value dan akan me-return Int
///Parameter num1 dengan label on memiliki tipe data Integer
///Parameter num2 dengan label and memiliki tipe data Integer
func perform(_ operation: (Int, Int) -> Int, on num1: Int, and num2: Int) -> Int {
    operation(num1, num2)
}

perform(+, on: 10, and: 20)
perform(-, on: 10, and: 20)
perform(*, on: 10, and: 20)
perform(/, on: 10, and: 20)

//Bagaimana jika function diatas juga harus bisa menghandle Double? CGFloat? CGSize? Berarti kita perlu membuat 3 Fungsi dengan Parameter sama tapi Tipe Data yang berbeda?
//Jawabannya TIDAK PERLU, hal diatas bisa dihandle dengan Generic

//MARK: - GENERICS FUNCTION (CORE SWIFT: EFFICIENT FUNCTION)
///Function diatas akan dibuat untuk dapat menghandle Numerical Data Type (Int, Double, Float, CGFloat, CGSize) dengan metode Generic
///Numeric merupakan Protocol bawaan (Built-in) Swift yang berbasis Generic untuk bisa mengolah seluruh jenis Numerical Data Type

//MARK: - Hal yang perlu diperhatikan ketika membuat Generic Function:
///1. Pada code generic dibawah ini, generic biasanya menggunakan 1 huruf inisial (bebas) didalam konteks ini menggunakan huruf N untuk conforms ke protocol Numeric (generic<N: Numeric>)
///2. Kemundian ganti Tipe data didalam parameter dengan huruf N

//MARK: - IMPELEMENTASI GENERIC BERDASARKAN FUNCTION DIATAS
///Pada Tipe Data didalam parameter tidak bisa langsung diganti dengan Numeric harus melewati metode Generic terlebih dahulu seperti Step 1 & 2
func generic<N: Numeric>(_ operation: (N, N) -> N, on num1: N, and num2: N) -> N {
    operation(num1, num2)
}

let x = generic(+, on: 10.2, and: 20)
print(type(of: x)) ///Menghasilkan Tipe Data Double

let y = generic(-, on: 10, and: 20)
print(type(of: y)) ///Menghasilkan Tipe Data Integer

//MARK: - IMPLEMENTASI GENERIC (CARA ALTERNATIF)
///Cara alternatif ini merupakan varian dari generic yang bisa dideklarasikan jika ada banyak Generic yang digunakan pada satu Generic Function (contohnya seperti code yang di comment dibawah ini)
///Ada 3 Generic yang dideklarasikan dibawah ini A B C
//func alternativeGeneric<A, B, C>(_ operation: (N, N) -> N, on num1: N, and num2: N) -> N where A: Numeric, B: BinaryInteger, C: AdditiveArithmetic  {
//    operation(num1, num2)
//}

func alternativeGeneric<N>(_ operation: (N, N) -> N, on num1: N, and num2: N) -> N where N: Numeric {
    operation(num1, num2)
}

let a = alternativeGeneric(+, on: 10.2, and: 20)
print(type(of: x)) ///Menghasilkan Tipe Data Double

let b = alternativeGeneric(-, on: 10, and: 20)
print(type(of: y)) ///Menghasilkan Tipe Data Integer

//MARK: - GENERIC + CUSTOM PROTOCOL
///Dummy Protocol
protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

///Dummy Struct
struct Person: CanJump, CanRun {
    func run() {
        "Running..."
    }
    
    func jump() {
        "Jumping..."
    }
}

//Creating Generic Function for Both Jump & Run
///This is a way to Combine 2 Protocol to access different Function inside that Protocol
func jumpAndRun<T: CanJump & CanRun>(_ value: T) {
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(person)

//MARK: - GENERIC + ARRAY (EXTENSION)
///Example of GENERIC + ARRAY (EXTENSION) by Returning the Longest String inside an Array
extension [String] {
    ///This function can return an Empty String
    func longestString() -> String? {
        self.sorted { (word1: String, word2: String) -> Bool in
            ///Sorted the array based on the Length in Descending Order (>)
            word1.count > word2.count
        }.first ///Return the First Element of Longest String after being Sorted (self.sorted)
    }
}

///Return the First Element of Longest String after being Sorted ("Primatio")
["Deka", "Primatio", "Deandra"].longestString()

///Example of GENERIC + ARRAY (EXTENSION) by Calculating the Average Value inside an Array of Integer
///This Exntesion handle an Array of Integer
extension [Int] {
    ///Since, this is average value the result can be a Double or an Integer so it would be perfect if it return a Double
    func average() -> Double {
        ///Using Reduce built in Function
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

///This is how Reduce Works based on the Array Below:
///self.reduce(0, +) means start from index 0 then add to the next index which is index 1:
/// 1 + 2 = 3, then add the results to the next index which is index 2:
/// 3 + 3 = 6, then add the results to the next index which is index 3:
/// 6 + 4 = 10, and so on...
[1, 2, 3, 4].average() ///The result is 2,5 because 10 / number of index (4) = 10 / 4 = 2,5

//Catatan: Array di Swift sebenarnya adalah bagian dari Generic Structure
///Cara Alternatif menulis Array of String karena ada <Element>
let names: Array<String> = ["Deka", "Primatio"]

//MARK: - ADVANCE GENERIC (ASSOCIATED PROTOCOL) VERY INTIMIDATED TOPIC
///Associated Protocol (associatedType) merupakan sebuah cara membuat Protocol biasa menjadi Generic
///Custom Protocol of Any View
protocol View {
    ///addSubView(_ view: View) meaning any View can add Another View to itself
    func addSubView(_ view: View)
}

extension View {
    ///Default Implementation
    func addSubView(_ view: View) {
        //Empty
    }
}

///Buttons conforms to View Protocol Extension
struct Button: View {
    //Empty
}

struct Table: View {
    //Empty
}

//MARK: - This is a Custom Protocol of PresentableAsView that Accessing View above
///We want represent every object in our System that can be Turned into a View
///Penggunaan associatedtype untuk membuat Protocol diatas menjadi Generic
protocol PresentableAsView {
    ///Making any data type that Conforms to the View Protocol meaning IF something is Presentable as View,  It's View should actually be of Type View (can be a Button, Struct of Something no Matter What)
    associatedtype ViewType: View
    func produceView() -> ViewType ///Object that is Presentable as View should be to Produce a View to User (by accessing the associatedtype ViewType of View above)

    ///Any Type we want to Present an Object as a View
    ///We can Allow it to Configure itself using a SuperView as a reference of View Protocol (Not Generic)
    ///And making the Object (thisView) is a ViewType (Generic Paramter Protocol above)
    func configure(
        superView: View,
        thisView: ViewType
    )
    
    ///Every Object that is Presentable as View should have a function on it Called Present meaning
    ///view is already it is a ViewType because of producreView() function produces a ViewType and it will be Pass on view present function below
    ///superView should be anything that is View
    func present(
        view: ViewType,
        on superView: View
    )
}

//MARK: - Creating Default Impelementation with Extension of PresentableAsView Protocol
///Passing the Function fo Configure and Present as we learnt from Protocols before
extension PresentableAsView {
    func configure(
        superView: View,
        thisView: ViewType
    ) {
        //Empty by Default
    }
    
    ///Upon presenting a view on a superView, and adding the addSubView(view)
    func present(
        view: ViewType,
        on superView: View
    ) {
        superView.addSubView(view)
    }
}

//MARK: - Integrating MyButton with the Associated Protocol (Generic) Above as PresentableAsView
///Remember in the Protocols before, we need to Return all the Function Created inside the Protocol (of PresentableAsView)
///As the protocol has 3 function called produceView, configure, and present
struct MyButton: PresentableAsView {
    ///Remember of Generic Concept, the produceView() need to return ViewType because this is Associated Protocol (Generic) means the ViewType is a Placeholder of View
    ///So it can be replace it by returning Button View
    func produceView() -> Button {
        Button()
    }
    
    ///The code below is immediately knew, that thisView is a Button based on the produceView() function because it replace the TypeView
    func configure(superView: View, thisView: Button) {
        
    }
    
    ///And also it immediately knew, that view is a Button based on the produceView() function because it replace the TypeView
    func present(view: Button, on superView: View) {
        
    }
}

///Constraint the Generic Extension
extension PresentableAsView {
    ///Remember Extension in a Protocol Concept here
    ///If we add a function to this Extension: Any Object that conforms to PresentableAsView Protocol is going to get your Extension Values (can be function, variables, and constant)
    func doSomethingWithView() {
        "This is a button"
    }
}

//Cara memanggil Protocols Generic diatas sama dengan Protocol biasa
let button = MyButton() ///Buat instances
button.doSomethingWithView() ///Panggil instance dan fungsinya

struct MyTable: PresentableAsView {
    func produceView() -> Table {
        Table()
    }
}

//Cara memanggil Protocols Generic diatas sama dengan Protocol biasa
let myTable = MyTable() ///Buat instances
myTable.doSomethingWithView() ///Panggil instance dan fungsinya
