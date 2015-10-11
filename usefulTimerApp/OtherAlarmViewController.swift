//
//  OtherAlarmViewController.swift
//  usefulTimerApp
//
//  Created by Daisuke Shibato on 2015/10/11.
//  Copyright © 2015年 Smirnoff. All rights reserved.
//

import UIKit

private let cellIdentifier = "cell"


class OtherAlarmViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,
                                UIPickerViewDataSource ,UIPickerViewDelegate {
    
    // collectionView
    var collectionView:UICollectionView!
    
    // タイマー
    var timer:NSTimer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 画面とそのサイズ
        windowHeight = self.view.frame.height
        windowWidth = self.view.frame.width
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // create Layout
        let layout = CustomFlowLayout()
//        // レイアウトの大きさ
//        // direction of scroll
//        layout.scrollDirection = .Vertical
//        // セルの大きさ
//        layout.itemSize = CGSize(width: windowWidth / 2 - 5, height: windowHeight / 100 / 3 * 76)
//        // レイアウトのマージン
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 3, bottom: 0, right: 3)
//        // アイテム同士のマージン
//        layout.minimumInteritemSpacing = 0.0
//        // セクションとアイテムのマージン
//        layout.minimumLineSpacing = 2.0
//        // セクション毎のヘッダーサイズ.
//        layout.headerReferenceSize = CGSize(width: windowWidth, height: windowHeight / 100 * 12)
        
        // コレクションビュー作成
        collectionView = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collectionView.registerClass(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = UIColor.whiteColor()
        view.addSubview(collectionView)
        
        
        //ナビゲーションバー作成
        createNavigationBar()
        
        // ツールバー作成
        createToolBar()
        
        // 時間編集画面作成
        createEditView()
        
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)

        
        
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
        let cell:CustomUICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomUICollectionViewCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.tag = indexPath.row
        cell.button?.tag = indexPath.row
        cell.button?.page = 3
        cell.button?.setTitle(  (cell.button?.page.description)! + "-" + indexPath.row.description, forState: .Normal )
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
        myUIBarButtonToOthers.tintColor = UIColor.blueColor()
        
        
        
        
        myToolbar.items = [myUIBarButtonToGroupAlarm, myUIBarButtonToEveryDay, myUIBarButtonToOthers, myUIBarButtonToTimer]
        
        self.view.addSubview(myToolbar)
    }
    
    func createNavigationBar(){
        //navigationbar設定
        let navigationBar = UINavigationBar(frame: CGRect.zero)
        navigationBar.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.setItems([UINavigationItem(title: "Other")], animated: false)
        navigationBar.barTintColor = UIColor(red: 229.0/255.0, green: 213.0/255.0, blue: 68.0/255.0, alpha: 1.0)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.whiteColor()]
        self.view.addSubview(navigationBar)
        
        
        //constraints 設定
        let views = ["navigationBar": navigationBar]
        var layoutConstraints = [NSLayoutConstraint]()
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("|[navigationBar]|", options: [], metrics: nil, views: views)
        layoutConstraints += NSLayoutConstraint.constraintsWithVisualFormat("V:|[navigationBar(64)]", options: [], metrics: nil, views: views)
        NSLayoutConstraint.activateConstraints(layoutConstraints)
    }
    
    // EditView 作成
    func createEditView(){
        
        setupEditView(self, page: 3 )
        
        self.view.addSubview(hourPicker)
        self.view.addSubview(minutePicker)
        self.view.addSubview(secondPicker)
        
        hourPicker.delegate = self
        hourPicker.dataSource = self
        minutePicker.delegate = self
        minutePicker.dataSource = self
        secondPicker.delegate = self
        secondPicker.dataSource = self
        
        setButton.addTarget(self, action: "tapSetButton:", forControlEvents: .TouchUpInside)
        cancelButton.addTarget(self, action: "tapCancelButton:", forControlEvents: .TouchUpInside)
        hideEditView()
        
        
        
    }
    
    /*
    pickerに表示する列数を返すデータソースメソッド.
    (実装必須)
    */
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 3
    }
    
    /*
    pickerに表示する行数を返すデータソースメソッド.
    (実装必須)
    */
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if (component == 0){
            return hour_arr.count
        }else if (component == 1){
            return minute_arr.count
        }else if (component == 2){
            return second_arr.count
        }
        return 0;
    }
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if (component == 0){
            print(hour_arr[row].description)
            return hour_arr[row].description
        }else if (component == 1){
            return minute_arr[row].description
        }else if (component == 2){
            return second_arr[row].description
        }
        return "";
    }

    
    
    
    //NSTimerIntervalで指定された秒数毎に呼び出されるメソッド.
    func onUpdate(timer : NSTimer){
        
        let cells = collectionView.visibleCells() as! [CustomUICollectionViewCell]
        //print(cells)
        
        for cell in cells {
            //print(cell.button?.titleLabel?.text)
            //cell.button?.setTitle("hello", forState: .Normal)
        }
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
    
    func tapSetButton(sender: UIButton) {
        hideEditView()
    }
    
    
    func tapCancelButton(sender: UIButton) {
        hideEditView()
    }

    
    
    
}

