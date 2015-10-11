//
//  TimerViewController.swift
//  usefulTimerApp
//
//  Created by Daisuke Shibato on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import UIKit

private let cellIdentifier = "cell"

class TimerViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // collectionView
    var collectionView:UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画面とそのサイズ
        windowHeight = self.view.frame.height
        windowWidth = self.view.frame.width
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // create Layout
        let layout = UICollectionViewFlowLayout()
        // レイアウトの大きさ
        // direction of scroll
        layout.scrollDirection = .Vertical
        // セルの大きさ
        layout.itemSize = CGSize(width: windowWidth / 2 - 5, height: windowHeight / 100 / 3 * 80)
        // レイアウトのマージン
        layout.sectionInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
        // アイテム同士のマージン
        layout.minimumInteritemSpacing = 0.0
        // セクションとアイテムのマージン
        layout.minimumLineSpacing = 2.0
        // セクション毎のヘッダーサイズ.
        layout.headerReferenceSize = CGSize(width: windowWidth, height: windowHeight / 100 * 12)
        
        // コレクションビュー作成
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.registerClass(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.backgroundColor = UIColor.whiteColor()
        view.addSubview(collectionView)
        
        
        // ツールバー作成
        createToolBar()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // セルの総数を返す
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    // セルの設定
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.whiteColor()
        return cell
    }
    func createToolBar() {
        //Toolbar作成
        var myToolbar: UIToolbar!
        myToolbar = UIToolbar(frame: CGRectMake(0, self.view.bounds.size.height - 44, self.view.bounds.size.width, 50.0))
        myToolbar.layer.position = CGPoint(x: windowWidth/2, y: windowHeight-20.0)
        myToolbar.barStyle = UIBarStyle.Default
        myToolbar.tintColor = UIColor.grayColor()
        myToolbar.backgroundColor = UIColor.whiteColor()
        
        
        
        //Toolbarに追加するボタンの作成
        // 1. GroupAlarm画面へのボタン
        let myUIBarButtonToGroupAlarm: UIBarButtonItem = UIBarButtonItem(title: "G", style:.Plain, target: self, action: "onToolBarButtonClick:")
        myUIBarButtonToGroupAlarm.tag = 1
        myUIBarButtonToGroupAlarm.width = self.view.bounds.size.width / 5.0
        
        self.view.addSubview(myToolbar)
        
        // 2.EveryDay画面へのボタン
        let myUIBarButtonToEveryDay: UIBarButtonItem = UIBarButtonItem(title: "E", style:.Plain, target: self, action: "onToolBarButtonClick:")
        myUIBarButtonToEveryDay.tag = 2
        myUIBarButtonToEveryDay.width = self.view.bounds.size.width / 5.0
        
        // 3. Others画面へのボタン
        let myUIBarButtonToOthers: UIBarButtonItem = UIBarButtonItem(title: "O", style:.Plain, target: self, action: "onToolBarButtonClick:")
        myUIBarButtonToOthers.tag = 3
        myUIBarButtonToOthers.width = self.view.bounds.size.width / 5.0
        
        // 4. Timer画面へのボタン
        let myUIBarButtonToTimer: UIBarButtonItem = UIBarButtonItem(title: "T", style:.Plain, target: self, action: "onToolBarButtonClick:")
        myUIBarButtonToTimer.tag = 4
        myUIBarButtonToTimer.width = self.view.bounds.size.width / 5.0
        
        
        // 今表示している画面のタイトルの文字色変更
        myUIBarButtonToTimer.tintColor = UIColor.blueColor()
        
        
        
        
        myToolbar.items = [myUIBarButtonToGroupAlarm, myUIBarButtonToEveryDay, myUIBarButtonToOthers, myUIBarButtonToTimer]
        
        self.view.addSubview(myToolbar)
    }
    
    @IBAction func onToolBarButtonClick(sender: UIBarButtonItem) {
        
        switch sender.tag {
        case 1:
            let nextViewController: UIViewController = GroupAlarmViewController()
            nextViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
            self.presentViewController(nextViewController, animated: true, completion: nil)
            
        case 2:
            let nextViewController: UIViewController = EveryDayAlarmViewController()
            nextViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
            self.presentViewController(nextViewController, animated: true, completion: nil)
            
        case 3:
            let nextViewController: UIViewController = OtherAlarmViewController()
            nextViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
            self.presentViewController(nextViewController, animated: true, completion: nil)
            
        case 4:
            let nextViewController: UIViewController = TimerViewController()
            nextViewController.modalTransitionStyle = UIModalTransitionStyle.PartialCurl
            self.presentViewController(nextViewController, animated: true, completion: nil)
            
        default:
            break // do nothing
        }
    }

    
    
    
}


