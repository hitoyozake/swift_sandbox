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


func printMoreThan10(num: Int){
    guard num >= 10 else{
        return //guardは条件が成り立たない時にスコープを抜ける義務が発生する
    }
    print(num)
}

printMoreThan10(num:100)

// swiftのｓswitchみには網羅性が必要となる．defaultは網羅性を満たすのには楽だが安易な使用は注意
let a_ = 7
switch a_ {
case 0..<10 where a % 2 == 0:
    print("a is less than 10")
case 0..<10 where a % 2 != 0:
    print("a is less than 10 ver2")
case 10...100:
    print("a is in [10...100]")
default:
    print("default")
}





