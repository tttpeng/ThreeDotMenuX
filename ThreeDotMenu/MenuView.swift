//
//  MenuView.swift
//  ThreeDotMenu
//
//  Created by tpeng on 16/4/20.
//  Copyright © 2016年 tttpeng. All rights reserved.
//

import UIKit

class MenuView: UIView {


    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.whiteColor()        

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func drawTrianglePath()  {
        
    }
    
    
    override func drawRect(rect: CGRect) {
        self.drawTrianglePath()
    }
    
    
    
}
