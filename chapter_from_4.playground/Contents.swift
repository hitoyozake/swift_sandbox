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

func chapter_4(){
    

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

func variable_args(_ strings: String...){
    print("strings count is :", strings.count)
    
    for i in strings{
        print(i)
    }
}

variable_args("abc", "def", "ghiJKLMNOPQ")

//closureの実装
let my_closure = { (_ x: Int) -> Int in
        let x2 = x * 2
        return x2
    }

print(my_closure(4))


// 引数と戻り値の型を省略することも可能
var myclosure_ss : (String) -> Int

myclosure_ss = { string in
    return string.count
}
    
//簡略引数名
var c : (Int, Int) -> Int = {
    return $0 * $1
}

c(1, 5)

let n:Int = {
    return $0 + $1
}(1, 2)

// クロージャは外部引数名を使うことができない
let my_closure2 = { (b: Int)-> Int in
    b * 2
}

print(my_closure2(5))

let numbers = [ 1, 2, 3, 4, 5, 6, 7,8, 9, 10]

let filtered_nums = numbers.filter({$0%2==0})

print(filtered_nums)

func named(){
    print("hoge")
}

let closure_binded = named

// 関数はclosureの一種
closure_binded()

let array = Array(repeating: Array(repeating: 1, count: 3), count:4)
//array = [ [1, 1, 1],[1, 1, 1],[1, 1, 1],[1, 1, 1]]

var board: [[Int]] = {
    let sideLength = 3
    let row = Array(repeating: 1, count: 3)
    let board = Array(repeating: row, count: sideLength)
    return board
}()

print("hogehoge")
}
// *************** 型 ***************** //
// chapter5
struct SomeStruct{
    //メンバ変数のことをプロパティと呼ぶ
    //値を持つのでストアドプロパティ
    let value = 10
    var variable = 25
    static var s_value = 1
    
    
    var doubleProperty = 0
    //computed property
    var property = 0 {
        willSet {
            //プロパティ変更前に実施. newValueはsetされる予定の値として暗黙的に定義される
            let willSetValue = newValue
        }
        didSet{
            self.doubleProperty = property*2
            //プロパティ変更後に実施
            //オブザーバなどに使用する
        }
    }
    
    
    var computedProperty:Int{
        get { // getterは必須
            return doubleProperty * 2
        }
        
        set { //setterは省略可能
            // newValueはsetの= の右辺に渡された値を暗黙的に宣言
           self.property = 4.25 * newValue
        }
    }
    
    // 遅延setプロパティ．使用される直前まで初期化されない．初期化コストが高いクラスなどでは有用
    lazy var lv = 0
    
    
    func getValue()->Int{
        return self.value
    }
    
    func set_staticvalue(_ v: Int){
        SomeStruct.s_value = v
    }
    
    func get_staticvalue()->Int{
        return SomeStruct.s_value
    }
    
    func getVariable()->Int{
        return self.variable
    }
    
    func callFuncFromFunc(){
        getVariable()
    }
}

let sstr = SomeStruct()
let sstr2 = SomeStruct()
print(sstr.getValue())

sstr.callFuncFromFunc()

print(sstr.get_staticvalue())
sstr2.set_staticvalue(4)
print(sstr.get_staticvalue())









