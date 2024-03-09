import UIKit
//IF / ELSE Condtion merupakan sebuah Function yang akan tereksekusi berdasarkan kondisi yang terpenuhi

var isDarkModeOn = false

///Conditional IF / ELSE without Type Inference (Simple Boolean Check)
if isDarkModeOn == true {
    print("Thats's how it should be. (without Type Inference)")
} else {
    print("You are a pyscho")
}

///Conditional If / Else with Type Inference
if isDarkModeOn {
    print("Thats's how it should be. (with Type Inference)")
}

///Conditional IF / ELSE (Value Comparisons)
var myHighScore = 555
var yourHighScore = 444

if myHighScore > yourHighScore {
    print("I Win")
} else {
    print("You Win")
}

///Conditional IF / ELSE (Multiple Path with ELSE IF)
var highScore = 555

if highScore > 500 {
    print("You're the Best")
} else if highScore > 250 {
    print("You Win")
} else if highScore > 100 {
    print("You need improvement")
} else {
    print("Yikes")
}
