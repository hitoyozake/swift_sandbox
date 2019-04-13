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
let a_ = 8
switch a_ {
case 0..<10 where a_ % 2 == 0:
    print("a is less than 10")
    fallthrough // 次のパターンマッチの実行文も実行する(パターンマッチはしない．C++で言うbreakなし効果)
case 0..<10 where a_ % 2 != 0:
    print("a is less than 10 ver2")
case 10...100:
    print("a is in [10...100]")
default:
    print("default")
}


// swiftのlabel付き break

label: for i in 0...5{
    print("parent:", i)
    label2: for j in 0...5{
        print("child:", j)
        break label2
    }
}


repeat {
    print("do while -> repeat while")
   
    break
}while true

for i in 0..<4
{
    let a = "abc"
    print(i)
    defer {
        print(i, a)
        print("この文章は親スコープが抜ける時に実行される")
    }
    print("piyo")
}

// パターンマッチ***********
// ~=演算子 (パターンマッチした場合はtrueを返す．switchの内部でも使われている)

let u = 100

if u ~= 100{
    print("matched")
}

switch u {
case 99:
    break
case 99...100:
    print("99-100 matched")
default:
    print("default")
}

let lpt = 2 // let

switch lpt{
case let matched where lpt < 3:
    print("let matched,", matched)
case var matched:
    print("var matched,", matched)
}

// 列挙型パターンマッチ
enum Colors{
    case Red
    case Blue
    case Green
}

let color = Colors.Blue

switch color{
case .Red:
    print("RED")
case .Blue:
    print("Blue")
case .Green:
    print("Green")
}

//連想値パターンマッチ
enum ColorKinds{
    case rgb(Int, Int, Int)
    case cmyk(Int, Int, Int)
}
let color_k = ColorKinds.rgb(100, 100, 100)

switch color_k{
case .rgb:
    print("rgb")
case .cmyk:
    print("cmyk")
}

// type casting

let any: Any = 4

switch any{
case is String:
    print("string")
case is Int:
    print("int")
default:
    break
}
let int: Int = 4

switch int{
case is String:
    print("string")
case is Int:
    print("int")
default:
    break
}

print("*************rangeの確認************")
// rangeのて確認
let rangeA = 0 ..< 3 // 右半開区間

for i in rangeA{
    print(i) // 0, 1, 2
}

let rangeB = 0...3 //閉区間
//let zzz : range<int>

for i in rangeB{
    print(i) // 0, 1, 2, 3
}

// double区間
let rangeC : Range<Double>

/* integerではないのでこれはできない
//for i in rangeC {
//    print(i)
//}
*/

/********************/
for i in [1, 2, 3]{
    // forのその場で配列などを作ることも可能
    print(i)
}

// doubleの区間の活用

let dvalue=4.23

switch dvalue {
case 0.0:
    print("0.0")
case 3.0...5.0:
    print("3.0<=value<=5.0")
default:
    print("not matched")
}





