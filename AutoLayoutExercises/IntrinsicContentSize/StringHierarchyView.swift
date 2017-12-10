//
//  StringHierarchyView.swift
//  AutoLayoutExercises
//
//  Created by Dominik Personal on 10/12/2017.
//  Copyright © 2017 Dominik Olędzki. All rights reserved.
//

import UIKit

class StringHierarchyView: UIView {

    var font: UIFont = UIFont.preferredFont(forTextStyle: .body) { didSet { update() }}
    var model: Hierarchy<String> = Hierarchy<String>(value: "", children: []) { didSet { update() }}
    var indentSize = 40.0 as CGFloat { didSet { update() }}
    var rowSpacing = 20.0 as CGFloat { didSet { update() }}
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isOpaque = false
    }
    
    private func update() {
        invalidateIntrinsicContentSize()
        setNeedsDisplay()
    }
    
    override var intrinsicContentSize: CGSize {
        return hierarchySize(hierarchy: model)
    }

    func hierarchySize(hierarchy: Hierarchy<String>) -> CGSize {
        let firstSize = textSize(hierarchy.value)
        return hierarchy.children.reduce(firstSize, { (size, child) -> CGSize in
            let childSize = hierarchySize(hierarchy: child)
            return CGSize(
                width: max(size.width, indentSize + childSize.width),
                height: size.height + rowSpacing + childSize.height
            )
        })
    }
    
    func textSize(_ text: String) -> CGSize {
        return NSAttributedString(string: text, attributes: [.font : font]).size()
    }
    
    override func draw(_ rect: CGRect) {
        guard let ctx = UIGraphicsGetCurrentContext() else { return }
        ctx.setStrokeColor(UIColor.blue.cgColor)
        draw(hierarchy: model)
    }
    
    @discardableResult func draw(hierarchy: Hierarchy<String>) -> (CGFloat, CGFloat) {
        guard let ctx = UIGraphicsGetCurrentContext() else { fatalError() }
        
        let attributedString = NSAttributedString(string: hierarchy.value, attributes: [.font : font])
        let textSize = attributedString.size()
        attributedString.draw(at: .zero)
        
        var overallHeight = textSize.height
        var childPositions: [CGFloat] = []
        
        ctx.saveGState()
        ctx.translateBy(x: indentSize, y: textSize.height + rowSpacing)
        for node in hierarchy.children {
            let (firstLineHeight, childHeight) = draw(hierarchy: node)
            childPositions.append(overallHeight + rowSpacing + firstLineHeight/2)
            overallHeight += rowSpacing + childHeight
            
            ctx.translateBy(x: 0.0, y: childHeight + rowSpacing)
        }
        ctx.restoreGState()
        
        // draw line
        ctx.move(to: CGPoint(x: indentSize/2, y: textSize.height))
        for position in childPositions {
            ctx.addLine(to: CGPoint(x: indentSize/2, y: position))
            ctx.addLine(to: CGPoint(x: indentSize, y: position))
            ctx.move(to: CGPoint(x: indentSize/2, y: position))
        }
        ctx.strokePath()
    
        return (textSize.height, overallHeight)
    }
}
