//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

let nibFile = NSNib.Name("MyView")
var topLevelObjects : NSArray?

Bundle.main.loadNibNamed(nibFile, owner:nil, topLevelObjects: &topLevelObjects)
let views = (topLevelObjects as! Array<Any>).filter { $0 is NSView }

// Present the view in Playground
PlaygroundPage.current.liveView = views[0] as! NSView

print("hoge")

var x = 4

print(x)

var a: Int = 0

if a is Int {
    a = 15
} else{
    a = 12
}

for i in 1...100{
    if case 10...20 = i {
        print(i)
    }
}

var array = [0, 1, 2, 3, 4, 5, 6]

for i in array.filter({$0%2==0}){
    print(i)
}


func printMoreThan10(){

}



