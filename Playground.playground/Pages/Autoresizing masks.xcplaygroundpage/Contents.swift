//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

let screen = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
let container = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
screen.addSubview(container)


// fill entire view with view
let backgroundView = UIView(frame: container.bounds)
backgroundView.backgroundColor = .lightGray
backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
container.addSubview(backgroundView)


// centered view
let centeredView = UIView(frame: CGRect(
    x: (container.frame.size.width - 50) / 2,
    y: (container.frame.size.height - 50) / 2,
    width: 50,
    height: 50))
centeredView.backgroundColor = .red
centeredView.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin]
container.addSubview(centeredView)

// bottom right corner view
let bottomRightCornerView = UIView(
    frame: CGRect(
        x: container.frame.width,
        y: container.frame.height,
        width: -50.0,
        height: -50.0))
bottomRightCornerView.backgroundColor = UIColor.blue
bottomRightCornerView.autoresizingMask = [.flexibleLeftMargin, .flexibleTopMargin]
container.addSubview(bottomRightCornerView)


// fill left half of the view
let halfView = UIView(frame: container.frame.divided(atDistance: container.frame.size.width/2, from: .minXEdge).slice)
halfView.backgroundColor = UIColor.green.withAlphaComponent(0.5)
halfView.autoresizingMask = [.flexibleRightMargin, .flexibleWidth, .flexibleHeight]
container.addSubview(halfView)








// Change the container size to show that child views scale/move as well
func resize() {
    let frame = CGRect(x: 0, y: 0,
           width: (sin(CACurrentMediaTime()) + 1) * 100.0 + 200.0,
           height: (cos(CACurrentMediaTime() * 1.5) + 1) * 100.0 + 200.0)
    container.frame = frame
    DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(32), execute: resize)
}

resize()

PlaygroundPage.current.liveView = screen
