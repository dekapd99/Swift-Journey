import UIKit
//Extension merupakan sebuah Custom Functionality dari suatu Default Format Data Type / Class / Function / Button yang sudah ada

///Custom Extension of String to Remove Whitespace
extension String {
    func removeWhiteSpace() -> String {
        return components(separatedBy: .whitespaces).joined()
    }
}

let alphabet = "A B C D E F G"
print(alphabet)
print(alphabet.removeWhiteSpace())
