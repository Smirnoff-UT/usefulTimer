//
//  CustomButton.swift
//  usefulTimerApp
//
//  Created by Daisuke Shibato on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import Foundation
import UIKit

class CustomButton : UIButton {
    
    var timeHour:Int
    var timeMinute:Int
    
    required init (coder aDecoder: NSCoder) {
        self.timeHour = 0
        self.timeMinute = 0
        super.init(coder: aDecoder)!
        
        
    }
    
    override init(frame: CGRect) {
        self.timeHour = 0
        self.timeMinute = 0
        super.init(frame: frame)
    }
    
}