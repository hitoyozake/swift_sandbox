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

struct chapter6{
    let v:Int
    let x:Int
    // letなどのプロパティは初期化時に必ず初期化されていること
    
    // 自動的にinit(v, x)が定義される
    
}

class SampleClass{
    
    deinit{
        // 下位クラスから順次呼び出される
    }
}

let c6 = chapter6(v:3, x:2)

let sampleClass = SampleClass()


enum Week{
    case Sunday
    case Monday
    case Tuesday
    case Wednesday
    case Thursday
    case Friday
    case Saturday
    
    init?(_ name: String){
        switch name{
        case "日":
            self = .Sunday
        default:
            return nil
        }
        
    }

    var name: String{
        switch self{
        case .Sunday: return "日"
        case .Monday: return "月"
        case .Tuesday: return "火"
        case .Wednesday: return "水"
        case .Thursday: return "木"
        case .Friday: return "金"
        case .Saturday: return "土"
        case .Sunday: return "日"
        
        }
        
    }

}





