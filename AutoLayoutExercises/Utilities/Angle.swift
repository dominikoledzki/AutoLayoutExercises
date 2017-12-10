//
//  Angle.swift
//  AutoLayoutExercises
//
//  Created by Dominik Personal on 02/12/2017.
//  Copyright © 2017 Dominik Olędzki. All rights reserved.
//

import CoreGraphics

struct Angle {
    private let degreesFactor = 180.0/CGFloat.pi
    var radians: CGFloat
    var degrees: CGFloat {
        get {
            return radians * degreesFactor
        }
        set {
            radians = newValue / degreesFactor
        }
    }
    
    init(degrees: CGFloat) {
        self.radians = degrees / degreesFactor
    }
    
    init(radians: CGFloat) {
        self.radians = radians
    }
    
    var tangent: CGFloat {
        return tan(radians)
    }
    
    var sinus: CGFloat {
        return sin(radians)
    }
    
    var cosinus: CGFloat {
        return cos(radians)
    }
}
