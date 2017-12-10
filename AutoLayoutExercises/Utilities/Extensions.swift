//
//  Extensions.swift
//  AutoLayoutExercises
//
//  Created by Dominik Personal on 03/12/2017.
//  Copyright © 2017 Dominik Olędzki. All rights reserved.
//

import CoreGraphics

extension CGPoint {
    func movedBy(x: CGFloat = 0.0, y: CGFloat = 0.0) -> CGPoint {
        return CGPoint(x: self.x + x, y: self.y + y)
    }
}

extension CGFloat {
    var toRad: CGFloat {
        return self / 180.0 * CGFloat.pi
    }
}

extension CGPoint {
    static func + (_ point: CGPoint, _ size: CGSize) -> CGPoint {
        return CGPoint(x: point.x + size.width, y: point.y + size.height)
    }
}
