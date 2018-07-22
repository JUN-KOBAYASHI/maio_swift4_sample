//
//  ViewController.swift
//  maio_check
//
//  Created by KOBAYASHI Jun on 2018/07/22.
//  Copyright © 2018年 KOBAYASHI Jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet
    weak var adShowButton:UIButton!
    
    @IBOutlet
    weak var logWindow:UITextView!
    
    @IBOutlet
    weak var statusLabel:UILabel!

    
    // 動画広告の再生を開始するイベントハンドラ
    @IBAction func reloadTap(_ sender: UIButton) {
        LOG_METHOD()
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのインスタンスを取得
        logWindow.text = appDelegate.logMessage
    }

    // 動画広告の再生を開始するイベントハンドラ
    @IBAction func onOpenAd(_ sender: UIButton) {
        LOG_METHOD()

        let nowTime = nowDateStr()
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate //AppDelegateのイン
        appDelegate.logMessage = appDelegate.logMessage! + "\n" + nowTime! + "------------------------------------"
        appDelegate.logMessage = appDelegate.logMessage! + "\n" + nowTime! + "# 広告表示ボタンが押された"
        appDelegate.logMessage = appDelegate.logMessage! + "\n" + nowTime! + "------------------------------------"

        if Maio.canShow(){
            LOG(msg: "maio Show")
            statusLabel.text = "Status: canShow"
            Maio.show()
        }else{
            LOG(msg: "#### maio not canShow")
            statusLabel.text = "Status: "
        }

    }

    var canShowFlag: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        LOG_METHOD()
        
        logWindow.text = ""        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        LOG_METHOD()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        LOG_METHOD()
        statusLabel.text = "Status: "

        if Maio.canShow(){
            LOG(msg: "maio Show")
            statusLabel.text = "Status: canShow"
            // Maio.show()
        }else{
            LOG(msg: "#### maio not canShow")
            statusLabel.text = "Status: "
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        LOG_METHOD()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        LOG_METHOD()
    }
    
    func nowDateStr() -> String?{
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return formatter.string(from: Date()) + " : "
    }

}

