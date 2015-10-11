//
//  EditTime.swift
//  usefulTimerApp
//
//  Created by Daisuke Shibato on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import Foundation
import UIKit


var hourPicker: UIPickerView!
var minutePicker: UIPickerView!
var secondPicker:UIPickerView!

// 時間編集画面表示用
var hour_arr = [Int]()
var minute_arr:[Int] = []
var second_arr:[Int] = []


func setupEditView( _self : UIViewController, page : Int){
    
    // 初期化
    for var i = 0 ; i < 60 ; i++ {
        minute_arr.append(i)
        second_arr.append(i)
        if i < 24 {
            hour_arr.append(i)
        }
        
    }
    
    hourPicker = UIPickerView()
    minutePicker = UIPickerView()
    secondPicker = UIPickerView()
    
    // サイズを指定する.
    hourPicker.frame = CGRectMake(0,0,_self.view.bounds.width, 180.0)
    minutePicker.frame = CGRectMake(0,0,_self.view.bounds.width/10, 180.0)
    secondPicker.frame = CGRectMake(0,0,_self.view.bounds.width/10, 180.0)
    
    
    print("setup finish")
}
