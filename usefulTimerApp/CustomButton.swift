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
    var id:Int
    var page:Int
    
    required init (coder aDecoder: NSCoder) {
        self.timeHour = 0
        self.timeMinute = 0
        self.id = 0
        self.page = 0
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        self.timeHour = 0
        self.timeMinute = 0
        self.id = 0
        self.page = 0
        super.init(frame: frame)
    }
    
    func setId (id num : Int) {
        id = num
    }
    
    func setTime ( h hour: Int, m minute: Int ) {
        
        timeHour = hour
        timeMinute = minute
        
    }
    
    func getTime () -> (h : Int, m : Int) {
        
        return ( h : timeHour, m : timeMinute )
        
    }
    
}