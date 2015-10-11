//
//  UIImageExtention.swift
//  usefulTimerApp
//
//  Created by 茂山 丈太郎 on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import Foundation
import UIKit

//画面リサイズに関するｴｸｽﾃ
extension UIImage {
    
    func resize(size: CGSize) -> UIImage {
        let widthRatio = size.width / self.size.width
        let heightRatio = size.height / self.size.height
        let ratio = (widthRatio < heightRatio) ? widthRatio : heightRatio
        let resizedSize = CGSize(width: (self.size.width * ratio), height: (self.size.height * ratio))
        UIGraphicsBeginImageContext(resizedSize)
        drawInRect(CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    
    // 比率だけ指定する場合
    func resize(ratio ratio: CGFloat) -> UIImage {
        let resizedSize = CGSize(width: Int(self.size.width * ratio), height: Int(self.size.height * ratio))
        UIGraphicsBeginImageContext(resizedSize)
        drawInRect(CGRect(x: 0, y: 0, width: resizedSize.width, height: resizedSize.height))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
    func crop(rect : CGRect) -> UIImage{
        let cropCGImageRef = CGImageCreateWithImageInRect(self.CGImage, rect)
        let cropImage = UIImage(CGImage: cropCGImageRef!)
        return  cropImage
    }
}
