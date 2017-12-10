//
//  StickFigureViewController.swift
//  AutoLayoutExercises
//
//  Created by Dominik Personal on 10/12/2017.
//  Copyright © 2017 Dominik Olędzki. All rights reserved.
//

import UIKit

class StickFigureViewController: UIViewController {
    @IBOutlet weak var stickFigureView: StickFigureView!
    
    @IBOutlet weak var lineWidthSlider: UISlider!
    @IBOutlet weak var headDiameterSlider: UISlider!
    @IBOutlet weak var neckLengthSlider: UISlider!
    @IBOutlet weak var neckAngleSlider: UISlider!
    @IBOutlet weak var armsLengthSlider: UISlider!
    @IBOutlet weak var leftArmAngleSlider: UISlider!
    @IBOutlet weak var rightArmAngleSlider: UISlider!
    @IBOutlet weak var torsoLengthSlider: UISlider!
    @IBOutlet weak var torsoAngleSlider: UISlider!
    @IBOutlet weak var legsLengthSlider: UISlider!
    @IBOutlet weak var leftLegAngle: UISlider!
    @IBOutlet weak var rightLegAngleSlider: UISlider!
    
    @IBAction func onSliderValueChange() {
        stickFigureView.strokeWidth = CGFloat(lineWidthSlider.value)
        stickFigureView.headDiameter = CGFloat(headDiameterSlider.value)
        stickFigureView.neckLength = CGFloat(neckLengthSlider.value)
        stickFigureView.neckAngle.degrees = CGFloat(neckAngleSlider.value)
        stickFigureView.armsLength = CGFloat(armsLengthSlider.value)
        stickFigureView.leftArmAngle.degrees = CGFloat(leftArmAngleSlider.value)
        stickFigureView.rightArmAngle.degrees = CGFloat(rightArmAngleSlider.value)
        stickFigureView.torsoLength = CGFloat(torsoLengthSlider.value)
        stickFigureView.torsoAngle.degrees = CGFloat(torsoAngleSlider.value)
        stickFigureView.legsLength = CGFloat(legsLengthSlider.value)
        stickFigureView.leftLegAngle.degrees = CGFloat(leftLegAngle.value)
        stickFigureView.rightLegAngle.degrees = CGFloat(rightLegAngleSlider.value)
    }
}
