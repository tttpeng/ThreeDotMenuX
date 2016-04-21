//
//  ViewController.swift
//  ThreeDotMenu
//
//  Created by tpeng on 16/4/20.
//  Copyright © 2016年 tttpeng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var coverView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let titleLabel = UILabel()
        titleLabel.frame = CGRectMake(15, 30, 60, 20)
        titleLabel.text = "ToDay"
        titleLabel.textColor = UIColor.grayColor()
        self.view.addSubview(titleLabel)
        
        self.view.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        
        let line = UIView()
        line.frame = CGRectMake(15, 64, self.view.frame.size.width - 30, 1)
        line.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        self.view.addSubview(line)
        
        let button = ThreeDotButton()
        button.frame = CGRectMake(self.view.frame.size.width - 15 - 22, 30, 22, 22)
//        button.backgroundColor = UIColor.greenColor()
        
        button.addTarget(self, action: #selector(buttonTap(_:)), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
        
        coverView = UIView()
        coverView.frame = CGRectMake(0, 63, self.view.frame.size.width, self.view.frame.size.height - 63)
        coverView.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(coverView)
        coverView.alpha = 0
        
        coverView.backgroundColor = UIColor(red: 0.96, green: 0.96, blue: 0.96, alpha: 1)

        let contentLabel = UILabel()
        contentLabel.frame = CGRectMake(0,300,  coverView.frame.size.width,30);
        contentLabel.text = "Design By Taavo"
        contentLabel.contentMode = .Center
        contentLabel.textAlignment = .Center
        contentLabel.textColor = UIColor.lightGrayColor()
        coverView.addSubview(contentLabel)
        

        

    }
    
    

    func buttonTap(button: ThreeDotButton)  {
        button.showsMenu = !button.showsMenu
        
        if button.showsMenu {
            UIView.animateWithDuration(0.3) {
                self.coverView.alpha = 1
            }
        } else {
            UIView.animateWithDuration(0.3) {
                self.coverView.alpha = 0
            }
        }
    }
    
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

