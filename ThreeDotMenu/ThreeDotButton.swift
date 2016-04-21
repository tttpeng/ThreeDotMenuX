//
//  ThreeDotButton.swift
//  ThreeDotMenu
//
//  Created by tpeng on 16/4/21.
//  Copyright © 2016年 tttpeng. All rights reserved.
//

import UIKit
import Darwin

class ThreeDotButton: UIButton {
    
    private var leftDotShape: CAShapeLayer!
    private var midDotShape: CAShapeLayer!
    private var rightDotShape: CAShapeLayer!
    
    private var dotDiameter: CGFloat = 4
    private var lineWidth: CGFloat = 2
    private var margin: CGFloat = 1
    
    var showsMenu: Bool = false {
        didSet {
            if self.showsMenu {
                showMenu()
            } else {
                closeMenu()
            }
        }
    }
    

    func createLayersIfNeeded()  {
        
        let dotSpace = (frame.size.width - 14) / 2
        let h = self.bounds.size.height

        if leftDotShape == nil {
        leftDotShape = CAShapeLayer()
        leftDotShape.frame = CGRectMake(1, h - 5, dotDiameter, dotDiameter)
        leftDotShape.fillColor = UIColor.orangeColor().CGColor
        leftDotShape.backgroundColor = UIColor.grayColor().CGColor
        leftDotShape.cornerRadius = 2;
        leftDotShape.anchorPoint = CGPointMake(0.5, 1)
        
        midDotShape = CAShapeLayer()
        midDotShape.frame = CGRectMake(dotSpace + dotDiameter + 1, h - 5, 4, 4)
        midDotShape.cornerRadius = 2
        midDotShape.backgroundColor = UIColor.grayColor().CGColor
        midDotShape.anchorPoint = CGPointMake(0.5, 1)
        
        rightDotShape = CAShapeLayer()
        rightDotShape.frame = CGRectMake((dotSpace + dotDiameter) * 2  + 1, h - 5, 4, 4)
        rightDotShape.cornerRadius = 2
        rightDotShape.backgroundColor = UIColor.grayColor().CGColor
        rightDotShape.anchorPoint = CGPointMake(0.5, 1)
        
        self.layer.addSublayer(leftDotShape)
        self.layer.addSublayer(midDotShape)
        self.layer.addSublayer(rightDotShape)
            
        }
   
    }
    
    
    func showMenu() {
        
        leftDotShape.cornerRadius  = 1.5
        midDotShape.cornerRadius   = 1.5
        rightDotShape.cornerRadius = 1.5
        
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        let lineLength = CGFloat(sqrt(pow((Float(w) - (Float(margin) * 2 + Float(dotDiameter) + 1)),2) + pow((Float(h) - Float(dotDiameter) - 1),2)))
        let rotationAngle = atan((w - 2) / (h - 2));
        
        let boundsAnimation = CABasicAnimation(keyPath: "bounds")
        boundsAnimation.toValue = NSValue(CGRect: CGRectMake(0, 0, lineWidth, lineLength))
        
        let leftRotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        leftRotationAnimation.toValue = rotationAngle
        
        let leftAnimations = CAAnimationGroup()
        leftAnimations.animations = [leftRotationAnimation, boundsAnimation]
        leftAnimations.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        leftAnimations.duration = 0.3
        leftAnimations.fillMode = kCAFillModeForwards
        leftAnimations.removedOnCompletion = false
        
        let rightRotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rightRotationAnimation.toValue = -rotationAngle
        
        let rightAnimations = CAAnimationGroup()
        rightAnimations.animations = [rightRotationAnimation, boundsAnimation]
        rightAnimations.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        rightAnimations.duration = 0.3
        rightAnimations.removedOnCompletion = false
        rightAnimations.fillMode = kCAFillModeForwards
        
        let midAnimation = CABasicAnimation(keyPath: "opacity")
        midAnimation.fromValue = 1
        midAnimation.toValue = 0
        midAnimation.duration = 0.3
        midAnimation.removedOnCompletion = false
        midAnimation.fillMode = kCAFillModeForwards
        
        midDotShape.addAnimation(midAnimation, forKey: "opacity")
        leftDotShape.addAnimation(leftAnimations, forKey: "animation")
        rightDotShape.addAnimation(rightAnimations, forKey: "animation")
        
    }
    
    func closeMenu() {
        
        
        leftDotShape.cornerRadius  = 2
        midDotShape.cornerRadius   = 2
        rightDotShape.cornerRadius = 2

        let w = self.bounds.size.width
        let h = self.bounds.size.height
        let lineLength = CGFloat(sqrt(pow((Float(w) - 7.0),2) + pow((Float(h) - 6.0),2)))
        let rotationAngle = atan((w - 2) / (h - 2));
        
        let boundsAnimation = CABasicAnimation(keyPath: "bounds")
        boundsAnimation.fromValue = NSValue(CGRect: CGRectMake(0, 0, lineWidth, lineLength))
        boundsAnimation.toValue = NSValue(CGRect: CGRectMake(0, 0, dotDiameter, dotDiameter))
        
        let leftRotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        leftRotationAnimation.toValue = 0
        leftRotationAnimation.fromValue = rotationAngle
        
        let leftAnimations = CAAnimationGroup()
        leftAnimations.animations = [leftRotationAnimation, boundsAnimation]
        leftAnimations.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        leftAnimations.duration = 0.3
        leftAnimations.removedOnCompletion = false
        leftAnimations.fillMode = kCAFillModeForwards
        rightDotShape.addAnimation(leftAnimations, forKey: "animation")
        
        
        let rightRotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rightRotationAnimation.toValue = 0;
        rightRotationAnimation.fromValue = -rotationAngle
        
        
        let rightAnimations = CAAnimationGroup()
        rightAnimations.animations = [rightRotationAnimation, boundsAnimation]
        rightAnimations.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        rightAnimations.duration = 0.3
        rightAnimations.removedOnCompletion = false
        rightAnimations.fillMode = kCAFillModeForwards
        
        leftDotShape.addAnimation(leftAnimations, forKey: "animation")
        rightDotShape.addAnimation(rightAnimations, forKey: "animation")
        
        let midAnimation = CABasicAnimation(keyPath: "opacity")
        midAnimation.fromValue = 0
        midAnimation.toValue = 1
        midAnimation.removedOnCompletion = false
        midAnimation.fillMode = kCAFillModeForwards
        midDotShape.addAnimation(midAnimation, forKey: nil)
        
    }
    
    override func layoutSubviews() {
        createLayersIfNeeded()
    }
}
