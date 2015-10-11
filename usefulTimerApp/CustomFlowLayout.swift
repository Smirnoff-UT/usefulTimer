//
//  CustomFlowLayout.swift
//  usefulTimerApp
//
//  Created by 茂山 丈太郎 on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import UIKit

class CustomFlowLayout : UICollectionViewFlowLayout {
    
    required override init () {
        super.init()
        // direction of scroll
        self.scrollDirection = .Vertical
        // セルの大きさ
        self.itemSize = CGSize(width: windowWidth / 2 , height: windowHeight / 100 / 3 * 76)
        // レイアウトのマージン
        self.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        // アイテム同士のマージン
        self.minimumInteritemSpacing = 0.0
        // セクションとアイテムのマージン
        self.minimumLineSpacing = 0.0
        // セクション毎のヘッダーサイズ.
        self.headerReferenceSize = CGSize(width: windowWidth, height: windowHeight / 100 * 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}