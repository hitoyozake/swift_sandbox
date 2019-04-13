//: A Cocoa based Playground to present user interface

import AppKit
import PlaygroundSupport

let nibFile = NSNib.Name("MyView")
var topLevelObjects : NSArray?

Bundle.main.loadNibNamed(nibFile, owner:nil, topLevelObjects: &topLevelObjects)
let views = (topLevelObjects as! Array<Any>).filter { $0 is NSView }

// Present the view in Playground
PlaygroundPage.current.liveView = views[0] as! NSView

print("hello")

func get_double_value(x: Double) -> Double{
    return x*2.0
}

func get_double_value2(_ x: Int)->Int{//呼び出し時に引数名を省略させる(むしろ引数名をつけることができなくなる)には_ をつける
    return x * 2
}

print(get_double_value(x: 4.2))
print(get_double_value2(2))


//通常は戻り値を無視すると警告がコンパイラから発せられるが，discardableResult属性をつけるとそれを抑制することができる
@discardableResult
func get_discardableResult()->Double{
    return 1.0
}

get_discardableResult()
_ = get_discardableResult() // _で受け取ると明示的に結果を捨てることを示すことができる
//引数が２つの場合
func get_2double(x_ x: Double, y_ y: Double )->(Double, Double){
    return (x*2, y*2)
}

print(get_2double(x_: 4.1, y_: 3.2))

func get_2double2(x_ x : Double = 2.2, y_ y: Double)->Double{
    return 1.2
}
// swiftのdefault引数は最後である必要はない！
get_2double2(y_: 4.2)

//inout引数 すなわち参照渡し
func inout_test(_ s: inout String){
    s += "hoge"
}

var s:String = "piyo"
inout_test(&s)
print(s)
