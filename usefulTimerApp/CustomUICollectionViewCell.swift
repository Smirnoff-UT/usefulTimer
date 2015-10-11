//
//  CustomUICollectionViewCell.swift
//  usefulTimerApp
//
//  Created by Daisuke Shibato on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import UIKit

class CustomUICollectionViewCell : UICollectionViewCell{
    
    var textLabel : UILabel?
    var button : CustomButton?
    var edit_bt : UIButton?
    var image : UIImage?
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // CustomButtonを生成
        button = CustomButton(frame: CGRectMake(0, 0, frame.width, frame.height))
        
        //setTime = thisTimer.timeHour.description + " : " + thisTimer.timeMinute.description
        button?.setTitle( "12:00" , forState: .Normal )
        //角丸なし
        button?.layer.cornerRadius = 0
        //ボーダー幅(将来的にナシ)
        button?.layer.borderWidth = 0.3
        //ボーダー色(なし)
        button?.layer.borderColor = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 0.7).CGColor
        // 背景色(白にしておく)
        button?.backgroundColor = UIColor.whiteColor()
        // タイトル色
        button?.setTitleColor(UIColor.grayColor(), forState: .Normal)
        // アクション
        button?.addTarget(self, action: "tappedButton:", forControlEvents:.TouchUpInside)
        // Cellに追加.
        self.addSubview(button!)
        
        // EditButtonを生成
        edit_bt = UIButton()
        //角丸
        //edit_bt?.layer.cornerRadius = 10
        // Title
        edit_bt?.setTitle("+" , forState: .Normal)
        // Color
        edit_bt?.setTitleColor(UIColor.blackColor(), forState: .Normal)
        // Font
        edit_bt?.titleLabel!.font = UIFont(name: "Avenir",size: CGFloat(10))
        //ebtBackGroundColor
        edit_bt?.backgroundColor = UIColor(red: 0.7, green: 0.8, blue: 0.8, alpha: 1.0)
        // Size
        edit_bt?.frame = CGRectMake(0, 0, 30, 20)
        // Position
        edit_bt?.layer.position = CGPoint(x: self.layer.bounds.width / 5 * 4, y: self.layer.bounds.height / 7)
        edit_bt?.addTarget(self, action: "tappedEditButton:", forControlEvents: .TouchUpInside)
        // Cellに追加.
        self.addSubview(edit_bt!)
        
        

    }
    
    @IBAction func tappedButton (sender : UIButton ) {
        
        sender.setTitle("Tapped", forState: .Normal)
        
    }
    
    @IBAction func tappedEditButton (sender : UIButton ) {
        
        sender.setTitle("-", forState: .Normal)
        print(sender.superview?.superview?.tag)
        hourPicker.hidden = false
        minutePicker.hidden = false
        secondPicker.hidden = false
    }

    
}
