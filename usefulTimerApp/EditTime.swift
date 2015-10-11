//
//  EditTime.swift
//  usefulTimerApp
//
//  Created by Daisuke Shibato on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import Foundation
import UIKit

// 時間編集画面用のpicker
var hourPicker: UIPickerView!
var minutePicker: UIPickerView!
var secondPicker:UIPickerView!

// picker用の配列
var hour_arr:[Int] = []
var minute_arr:[Int] = []
var second_arr:[Int] = []

//画面を白くぼやけさせるためのやつ
var tempView : UIView = UIView()

// その真ん中の白いやつ
var editTimerView : UIView = UIView()

// セットボタン
var setButton : UIButton = UIButton()

// キャンセルボタン
var cancelButton : UIButton = UIButton()


func setupEditView( _self : UIViewController, page : Int){
    
    // 初期化
    for var i = 0 ; i < 60 ; i++ {
        minute_arr.append(i)
        second_arr.append(i)
        if i < 24 {
            hour_arr.append(i)
        }
        
    }
    
    print(minute_arr)
    
    hourPicker = UIPickerView()
    minutePicker = UIPickerView()
    secondPicker = UIPickerView()
    
    // サイズを指定する.
    hourPicker.frame = CGRectMake(_self.view.bounds.width/2 ,_self.view.bounds.height/2, _self.view.bounds.width/2, 400.0)
    minutePicker.frame = CGRectMake(0,_self.view.bounds.height/2, _self.view.bounds.width/10, 180.0)
    secondPicker.frame = CGRectMake(0,_self.view.bounds.height/2, _self.view.bounds.width/10, 180.0)
    
//    
//    // tempViewの設定
//    var rect = CGRectMake(0, 0, _self.view.frame.width, _self.view.frame.height)  // サイズを生成 (x, y, width, height): x,yは表示位置
//    tempView = UIView(frame: rect) // 生成したサイズを使って、ビューを生成
//    tempView.backgroundColor = UIColor.grayColor() // ビューの背景に色を設定
//    tempView.alpha = 0.7 // 透明度
//    
//    // 実際のポップアップの部分
//    rect = CGRectMake(_self.view.frame.width/6, _self.view.frame.height/4, _self.view.frame.width/3 * 2, _self.view.frame.height/2)  // サイズを生成 (x, y, width, height): x,yは表示位置
//    editTimerView = UIView(frame: rect) // 生成したサイズを使って、ビューを生成
//    editTimerView.backgroundColor = UIColor.whiteColor() // ビューの背景に色を設定
//    editTimerView.layer.cornerRadius = 7
//    
//    // セットボタン
//    setButton.setTitle("Set", forState: .Normal)
//    setButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
//    setButton.frame = CGRectMake(_self.view.frame.width/4, _self.view.frame.height/1.5, _self.view.frame.width/2, 50)
//    setButton.layer.cornerRadius = 7
//    setButton.layer.borderWidth = 0.3
//    setButton.layer.borderColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.7).CGColor
//    
//    // キャンセルボタン
//    cancelButton.setTitle("Close", forState: .Normal)
//    cancelButton.frame = CGRectMake(_self.view.frame.width/7, _self.view.frame.height/5, 100, 50)
//    cancelButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
//    
    
    
    
    
//    _self.view.addSubview(tempView)
//    _self.view.addSubview(editTimerView)
//    _self.view.addSubview(setButton)
//    _self.view.addSubview(cancelButton)
    
//    _self.view.addSubview(hourPicker)
//    _self.view.addSubview(minutePicker)
//    _self.view.addSubview(secondPicker)
    
    
    hourPicker.hidden = true
    minutePicker.hidden = true
    secondPicker.hidden = true
    tempView.hidden = true
    editTimerView.hidden = true
    setButton.hidden = true
    cancelButton.hidden = true
    
    
    print("setup finish")
}

func visibleEditView(){
    
    hourPicker.hidden = false
    minutePicker.hidden = false
    secondPicker.hidden = false
    tempView.hidden = false
    editTimerView.hidden = false
    setButton.hidden = false
    cancelButton.hidden = false
    
}

func hideEditView() {
    
    hourPicker.hidden = true
    minutePicker.hidden = true
    secondPicker.hidden = true
    tempView.hidden = true
    editTimerView.hidden = true
    setButton.hidden = true
    cancelButton.hidden = true
    
}


