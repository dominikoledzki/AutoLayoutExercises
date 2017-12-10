//
//  StickFigureView.swift
//  AutoLayoutExercises
//
//  Created by Dominik Personal on 04/12/2017.
//  Copyright © 2017 Dominik Olędzki. All rights reserved.
//

import UIKit

struct Proxy<ValueType, IBType> {
    
}

@IBDesignable
class StickFigureView: UIView {
    
    var strokeWidth: CGFloat = 2.0              { didSet { onParameterChange() } }
    var headDiameter: CGFloat = 50.0            { didSet { onParameterChange() } }
    var neckLength: CGFloat = 20.0              { didSet { onParameterChange() } }
    var neckAngle = Angle(degrees: 180.0)       { didSet { onParameterChange() } }
    var armsLength: CGFloat = 40.0              { didSet { onParameterChange() } }
    var leftArmAngle = Angle(degrees: 90.0)     { didSet { onParameterChange() } }
    var rightArmAngle = Angle(degrees: -90.0)   { didSet { onParameterChange() } }
    var torsoLength: CGFloat = 60.0             { didSet { onParameterChange() } }
    var torsoAngle = Angle(degrees: 180.0)      { didSet { onParameterChange() } }
    var legsLength: CGFloat = 50.0              { didSet { onParameterChange() } }
    var leftLegAngle = Angle(degrees: -45.0)    { didSet { onParameterChange() } }
    var rightLegAngle = Angle(degrees: 45.0)    { didSet { onParameterChange() } }
    
    private func onParameterChange() {
        invalidateIntrinsicContentSize()
        setNeedsDisplay()
    }
    
    private var leftLegSize: CGSize {
        return CGSize(
            width: leftLegAngle.sinus * legsLength,
            height: leftLegAngle.cosinus * legsLength
        )
    }
    
    private var rightLegSize: CGSize {
        return CGSize(
            width: rightLegAngle.sinus * legsLength,
            height: rightLegAngle.cosinus * legsLength
        )
    }
    
    private var bodySize: CGSize {
        return CGSize(
            width: torsoAngle.sinus * torsoLength,
            height: torsoAngle.cosinus * torsoLength
        )
    }
    
    private var leftArmSize: CGSize {
        return CGSize(
            width: leftArmAngle.sinus * armsLength,
            height: leftArmAngle.cosinus * armsLength
        )
    }
    
    private var rightArmSize: CGSize {
        return CGSize(
            width: rightArmAngle.sinus * armsLength,
            height: rightArmAngle.cosinus * armsLength
        )
    }
    
    private var neckSize: CGSize {
        return CGSize(
            width: neckAngle.sinus * neckLength,
            height: neckAngle.cosinus * neckLength
        )
    }
    
    override var intrinsicContentSize: CGSize {
        var cursor = CGPoint.zero
        var bounds = CGRect(origin: cursor, size: CGSize.zero)
        
        cursor = cursor + leftLegSize
        bounds = bounds.union(CGRect(origin: cursor, size: CGSize.zero))
        
        cursor = CGPoint.zero
        cursor = cursor + rightLegSize
        bounds = bounds.union(CGRect(origin: cursor, size: CGSize.zero))
        
        cursor = CGPoint.zero
        cursor = cursor + bodySize
        bounds = bounds.union(CGRect(origin: cursor, size: CGSize.zero))
        
        let armsJoint = cursor
        
        cursor = cursor + neckSize
        bounds = bounds.union(CGRect(origin: cursor, size: CGSize.zero))
        
        let headCenter = cursor + CGSize(width: neckAngle.sinus * headDiameter / 2, height: neckAngle.cosinus * headDiameter / 2)
        bounds = bounds.union(CGRect(
            origin: headCenter.movedBy(x: -headDiameter/2, y: -headDiameter/2),
            size: CGSize(width: headDiameter, height: headDiameter)))
        
        cursor = armsJoint + leftArmSize
        bounds = bounds.union(CGRect(origin: cursor, size: CGSize.zero))
        
        cursor = armsJoint + rightArmSize
        bounds = bounds.union(CGRect(origin: cursor, size: CGSize.zero))
        
        bounds = bounds.insetBy(dx: -strokeWidth/2, dy: -strokeWidth/2)
        
        return bounds.size
    }
    
    override func draw(_ rect: CGRect) {
        UIColor.blue.setStroke()
        
        var bounds = CGRect.zero
        
        let path = UIBezierPath()
        path.lineWidth = strokeWidth
        path.lineCapStyle = .round
        path.lineJoinStyle = .round
        
        path.move(to: CGPoint.zero)
        path.addLine(to: path.currentPoint + leftLegSize)
        bounds = bounds.union(CGRect(origin: path.currentPoint, size: CGSize.zero))
        
        path.move(to: CGPoint.zero)
        path.addLine(to: path.currentPoint + rightLegSize)
        bounds = bounds.union(CGRect(origin: path.currentPoint, size: CGSize.zero))
        
        path.move(to: CGPoint.zero)
        path.addLine(to: path.currentPoint + bodySize)
        bounds = bounds.union(CGRect(origin: path.currentPoint, size: CGSize.zero))

        let armsJoint = path.currentPoint
        path.addLine(to: path.currentPoint + neckSize)
        bounds = bounds.union(CGRect(origin: path.currentPoint, size: CGSize.zero))

        let headCenter = path.currentPoint + CGSize(width: neckAngle.sinus * headDiameter / 2, height: neckAngle.cosinus * headDiameter / 2)
        path.addArc(withCenter: headCenter, radius: headDiameter / 2, startAngle: -neckAngle.radians - CGFloat.pi/2, endAngle: -neckAngle.radians + 1.5 * CGFloat.pi, clockwise: true)
        bounds = bounds.union(CGRect(
            origin: headCenter.movedBy(x: -headDiameter/2, y: -headDiameter/2),
            size: CGSize(width: headDiameter, height: headDiameter)))
        
        
        path.move(to: armsJoint)
        path.addLine(to: path.currentPoint + leftArmSize)
        bounds = bounds.union(CGRect(origin: path.currentPoint, size: CGSize.zero))
        
        path.move(to: armsJoint)
        path.addLine(to: path.currentPoint + rightArmSize)
        bounds = bounds.union(CGRect(origin: path.currentPoint, size: CGSize.zero))
        
        path.apply(CGAffineTransform(translationX: -bounds.origin.x + strokeWidth/2, y: -bounds.origin.y + strokeWidth/2))
        
        path.stroke()
    }
}
