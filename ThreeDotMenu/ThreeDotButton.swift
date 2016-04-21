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
        
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        
        print()

        if leftDotShape == nil {
        leftDotShape = CAShapeLayer()
        leftDotShape.frame = CGRectMake(1, h - 5, 4, 4)
        leftDotShape.fillColor = UIColor.orangeColor().CGColor
        leftDotShape.backgroundColor = UIColor.grayColor().CGColor
        leftDotShape.cornerRadius = 2;
        leftDotShape.anchorPoint = CGPointMake(0.5, 1)
        
        midDotShape = CAShapeLayer()
        midDotShape.frame = CGRectMake(dotSpace + dotDiameter + 1  , h-5, 4, 4)
        midDotShape.cornerRadius = 2
        midDotShape.backgroundColor = UIColor.grayColor().CGColor
        midDotShape.anchorPoint = CGPointMake(0.5, 1)
        
        rightDotShape = CAShapeLayer()
        rightDotShape.frame = CGRectMake((dotSpace + dotDiameter) * 2  + 1, h-5, 4, 4)
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
        let length = CGFloat(sqrt(pow((Float(w) - 7),2) + pow((Float(h) - 5),2)))

        
        let basic = CABasicAnimation(keyPath: "bounds")
        basic.toValue = NSValue(CGRect: CGRectMake(0, 0, 2, length))
        let scaleAnimation = CABasicAnimation(keyPath: "transform.rotation")
        scaleAnimation.toValue = atan((w - 2) / (h - 2));
        let animation = CAAnimationGroup()
        animation.animations = [scaleAnimation, basic]
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation.duration = 0.3
        animation.fillMode = kCAFillModeForwards
        animation.removedOnCompletion = false
        
        
        let basic2 = CABasicAnimation(keyPath: "bounds")
        basic2.toValue = NSValue(CGRect: CGRectMake(0, 0, 2, length))
        let scaleAnimation2 = CABasicAnimation(keyPath: "transform.rotation")
        scaleAnimation2.toValue = -atan((w - 2) / (h - 2));
        let animation2 = CAAnimationGroup()
        animation2.animations = [scaleAnimation2, basic2]
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation2.duration = 0.3
        animation2.removedOnCompletion = false
        animation2.fillMode = kCAFillModeForwards
        
        leftDotShape.addAnimation(animation, forKey: "animation")
        rightDotShape.addAnimation(animation2, forKey: "animation")
        
        
        let touming = CABasicAnimation(keyPath: "opacity")
        touming.fromValue = 1
        touming.toValue = 0
        touming.duration = 0.3
        touming.removedOnCompletion = false
        touming.fillMode = kCAFillModeForwards
        
        midDotShape.addAnimation(touming, forKey: "opacity")
        
        
    }
    
    func closeMenu() {
        
        
        leftDotShape.cornerRadius  = 2
        midDotShape.cornerRadius   = 2
        rightDotShape.cornerRadius = 2

        let w = self.bounds.size.width
        let h = self.bounds.size.height
        let length = CGFloat(sqrt(pow((Float(w) - 6.0),2) + pow((Float(h) - 6.0),2)))
        
        let basic3 = CABasicAnimation(keyPath: "bounds")
        basic3.fromValue = NSValue(CGRect: CGRectMake(0, 0, 4, length))
        basic3.toValue = NSValue(CGRect: CGRectMake(0, 0, 4, 4))
        
        let scaleAnimation3 = CABasicAnimation(keyPath: "transform.rotation")
        scaleAnimation3.toValue = 0
        let new = rightDotShape.presentationLayer() as! CALayer
        scaleAnimation3.fromValue = -atan(w/h)
        
        let animation3 = CAAnimationGroup()
        animation3.animations = [scaleAnimation3, basic3]
        animation3.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation3.duration = 0.3
        animation3.removedOnCompletion = false
        animation3.fillMode = kCAFillModeForwards
        rightDotShape.addAnimation(animation3, forKey: "animation")
        
        let basic2 = CABasicAnimation(keyPath: "bounds")
        basic2.toValue = NSValue(CGRect: CGRectMake(0, 0, 4, 4))
        basic2.fromValue = NSValue(CGRect: CGRectMake(0, 0, 4, length))
        
        let scaleAnimation2 = CABasicAnimation(keyPath: "transform.rotation")
        scaleAnimation2.toValue = 0;
        let new2 = atan(w/h)
//            layer.presentationLayer() as! CALayer
        
        scaleAnimation2.fromValue = new2
        
        
        
        let animation2 = CAAnimationGroup()
        animation2.animations = [scaleAnimation2, basic2]
        animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        animation2.duration = 0.3
        animation2.removedOnCompletion = false
        animation2.fillMode = kCAFillModeForwards
        
        leftDotShape.addAnimation(animation2, forKey: "animation")
        rightDotShape.addAnimation(animation3, forKey: "animation")
        
        let touming = CABasicAnimation(keyPath: "opacity")
        touming.fromValue = 0
        touming.toValue = 1
        touming.removedOnCompletion = false
        touming.fillMode = kCAFillModeForwards
        midDotShape.addAnimation(touming, forKey: nil)
        
    }
    
    
    override func layoutSubviews() {
        createLayersIfNeeded()
    }
}
