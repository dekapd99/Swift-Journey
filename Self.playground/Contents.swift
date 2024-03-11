import UIKit
//Self merupakan konsep pointer (current object) yang menunjukkan dirinya sendiri dalam suatu Instance bisa Class / View / Function / Struct.

///Explicit "self"
struct Human {
    var canTalk: Bool
    
    init(canTalk: Bool) {
        self.canTalk = canTalk ///Maksud dari Self disini adalah menunjuk pada Current Object, yaitu Human
    }
}

let humans = Human(canTalk: true)
