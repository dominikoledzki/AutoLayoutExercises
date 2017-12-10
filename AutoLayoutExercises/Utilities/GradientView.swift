//
//  GradientView.swift
//  AutoLayoutExercises
//
//  Created by Dominik Olędzki on 19/11/2017.
//

import UIKit

class GradientView: UIView {
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    var gradientLayer: CAGradientLayer {
        return layer as! CAGradientLayer
    }
}
