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

let c6 = chapter6(v:3, x:2)



