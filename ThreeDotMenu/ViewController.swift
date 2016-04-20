//
//  ViewController.swift
//  ThreeDotMenu
//
//  Created by tpeng on 16/4/20.
//  Copyright © 2016年 tttpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let layer: CAShapeLayer = CAShapeLayer()
    let midLayer: CAShapeLayer = CAShapeLayer()
    let rightDot: CAShapeLayer = CAShapeLayer()

    var overRight: Bool = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapClick))
        
        view.addGestureRecognizer(tap)


        
        
        
        let menu = MenuView(frame: self.view.frame)
        view.addSubview(menu)
        
        layer.setNeedsDisplay()
        let myBezier = UIBezierPath(roundedRect: CGRectMake(0, 0, 4, 0), cornerRadius: 10)
        UIColor.orangeColor().setFill()
        myBezier.fill()
        
        layer.frame = CGRectMake(120, 320, 4, 4)
        layer.fillColor = UIColor.orangeColor().CGColor
        layer.backgroundColor = UIColor.redColor().CGColor
        layer.cornerRadius = 2;
        layer.anchorPoint = CGPointMake(0.5, 1)

        midLayer.frame = CGRectMake(127, 320, 4, 4)
        midLayer.cornerRadius = 2
        midLayer.backgroundColor = UIColor.redColor().CGColor
        midLayer.anchorPoint = CGPointMake(0.5, 1)
        
        rightDot.frame = CGRectMake(134, 320, 4, 4)
        rightDot.cornerRadius = 2
        rightDot.backgroundColor = UIColor.redColor().CGColor
        rightDot.anchorPoint = CGPointMake(0.5, 1)
        
        menu.layer.addSublayer(rightDot)
        menu.layer.addSublayer(midLayer)
        menu.layer.addSublayer(layer)

        
        
        overRight = false

        
        let delayInSeconds = 3.0
        let popTime = dispatch_time(DISPATCH_TIME_NOW,Int64(delayInSeconds * Double(NSEC_PER_SEC)))
//        dispatch_after(4, dispatch_get_main_queue()) {
//            print("haha")
//            //            myBezier.animationDidStart(basic)
//
//        }

    }

    
    

    func tapClick()  {
        
        
        if overRight {
            let basic3 = CABasicAnimation(keyPath: "bounds")
            basic3.fromValue = NSValue(CGRect: CGRectMake(0, 0, 4, 20))

            basic3.toValue = NSValue(CGRect: CGRectMake(0, 0, 4, 4))
            let scaleAnimation3 = CABasicAnimation(keyPath: "transform.rotation")
            scaleAnimation3.toValue = 0

            let new = rightDot.presentationLayer() as! CALayer
            
            scaleAnimation3.fromValue = new.valueForKeyPath("transform.rotation")
            let animation3 = CAAnimationGroup()
            animation3.animations = [scaleAnimation3, basic3]
            animation3.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation3.duration = 0.3
            animation3.removedOnCompletion = false
            animation3.fillMode = kCAFillModeForwards
            rightDot.addAnimation(animation3, forKey: "animation")

            let basic2 = CABasicAnimation(keyPath: "bounds")
            basic2.toValue = NSValue(CGRect: CGRectMake(0, 0, 4, 4))
            basic2.fromValue = NSValue(CGRect: CGRectMake(0, 0, 4, 20))

            let scaleAnimation2 = CABasicAnimation(keyPath: "transform.rotation")
            scaleAnimation2.toValue = 0;
            let new2 = layer.presentationLayer() as! CALayer

            scaleAnimation2.fromValue = new2.valueForKeyPath("transform.rotation")
            


            let animation2 = CAAnimationGroup()
            animation2.animations = [scaleAnimation2, basic2]
            animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation2.duration = 0.3
            animation2.removedOnCompletion = false
            animation2.fillMode = kCAFillModeForwards
            
            layer.addAnimation(animation2, forKey: "animation")
            rightDot.addAnimation(animation3, forKey: "animation")
            
            let touming = CABasicAnimation(keyPath: "opacity")
            touming.fromValue = 0
            touming.toValue = 1
            touming.removedOnCompletion = false
            touming.fillMode = kCAFillModeForwards
            midLayer.addAnimation(touming, forKey: nil)

            
            
        }
        else {
            let basic = CABasicAnimation(keyPath: "bounds")
            basic.toValue = NSValue(CGRect: CGRectMake(0, 0, 4, 20))
            let scaleAnimation = CABasicAnimation(keyPath: "transform.rotation")
            scaleAnimation.toValue = M_PI_4;
            let animation = CAAnimationGroup()
            animation.animations = [scaleAnimation, basic]
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation.duration = 0.3
            animation.fillMode = kCAFillModeForwards
            animation.removedOnCompletion = false
            
            
            let basic2 = CABasicAnimation(keyPath: "bounds")
            basic2.toValue = NSValue(CGRect: CGRectMake(0, 0, 4, 20))
            let scaleAnimation2 = CABasicAnimation(keyPath: "transform.rotation")
            scaleAnimation2.toValue = -M_PI_4;
            let animation2 = CAAnimationGroup()
            animation2.animations = [scaleAnimation2, basic2]
            animation2.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            animation2.duration = 0.3
            animation2.removedOnCompletion = false
            animation2.fillMode = kCAFillModeForwards
            
            layer.addAnimation(animation, forKey: "animation")
            rightDot.addAnimation(animation2, forKey: "animation")
            
            
            let touming = CABasicAnimation(keyPath: "opacity")
            touming.fromValue = 1
            touming.toValue = 0
            touming.removedOnCompletion = false
            touming.fillMode = kCAFillModeForwards

            midLayer.addAnimation(touming, forKey: "opacity")
        }
        
        
        
      overRight = !overRight
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

