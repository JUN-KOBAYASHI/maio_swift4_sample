//
//  AppDelegate.swift
//  maio_check
//
//  Created by KOBAYASHI Jun on 2018/07/22.
//  Copyright © 2018年 KOBAYASHI Jun. All rights reserved.
//

import UIKit
import Maio

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MaioDelegate {

    var window: UIWindow?
    let maio_media_id = "YOUR_MAIO_MEDIA_ID" as String // MAIO_MEDIA_ID
    let developFlag = true
    var logMessage:String! = ""

    func maio_loadAdNetwork(){
        LOG_METHOD()
        
        // maio 広告ロード
            LOG(msg: "maio loadAD")
        let nowTime = nowDateStr()
            if developFlag == true {
                // Maio.setAdTestMode(true)    // テストモード
                Maio.start(withMediaId: "DemoPublisherMedia", delegate: self)
                logMessage = logMessage! + "\n" + nowTime! + "maio start - DemoPublisherMedia"
            }else{
                Maio.start(withMediaId: maio_media_id, delegate: self)
                logMessage = logMessage! + "\n" + nowTime! + "maio start - \(maio_media_id)"
            }
    }

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        maio_loadAdNetwork()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    // MARK: maio delegate
    
    // 全てのゾーンの広告表示準備が完了したら呼ばれます。
    func maioDidInitialize() {
        LOG_METHOD()
        LOG(msg: "全てのゾーンの広告表示準備が完了")
        let nowTime = nowDateStr()
        logMessage = logMessage! + "\n" + nowTime! + "全てのゾーンの広告表示準備が完了"

    }
    
    // 広告がクリックされ、ストアや外部リンクへ遷移した時に呼ばれます。
    func maioDidClickAd(_ zoneId: String!) {
        LOG_METHOD()
        LOG(msg: "広告がクリックされ、ストアや外部リンクへ遷移した")
        let nowTime = nowDateStr()
        logMessage = logMessage! + "\n" + nowTime! + "広告がクリックされ、ストアや外部リンクへ遷移した"

    }
    
    // 広告が閉じられた際に呼ばれます。
    func maioDidCloseAd(_ zoneId: String!) {
        LOG_METHOD()
        LOG(msg: "広告が閉じられた")
        let nowTime = nowDateStr()
        logMessage = logMessage! + "\n" + nowTime! + "広告が閉じられた"
    }
    
    // 広告が再生される直前に呼ばれます。
    // 最初の再生開始の直前にのみ呼ばれ、リプレイ再生の直前には呼ばれません。
    func maioWillStartAd(_ zoneId: String!) {
        LOG_METHOD()
        LOG(msg: "広告が再生される直前")
        let nowTime = nowDateStr()
        logMessage = logMessage! + "\n" + nowTime! + "広告が再生される直前"
    }
    
    // SDK 内でエラーを検知した際に呼ばれます。
    // 発生タイミングは不定ですので、ログ出力やエラー計測以外の具体的な処理（ビジネスロジック等）を行わないで下さい。
    func maioDidFail(_ zoneId: String!, reason: MaioFailReason) {
        LOG_METHOD()
        LOG(msg: "SDK 内でエラーを検知した")
        LOG(msg: " zoneID: \(zoneId)")
        let nowTime = nowDateStr()
        logMessage = logMessage! + "\n" + nowTime! + "SDK 内でエラーを検知した"

        
        switch reason {
        case MaioFailReason.adStockOut: // 広告在庫切れ
            LOG(msg: " reason: 広告在庫切れ")
            logMessage = logMessage! + " " + nowTime! + "reason: 広告在庫切れ"

        case MaioFailReason.networkConnection: // ネットワーク接続エラー
            LOG(msg: " reason: ネットワーク接続エラー")
            logMessage = logMessage! + " " + nowTime! + "reason: ネットワーク接続エラー"

        case MaioFailReason.networkClient: // HTTP status 4xx クライアントエラー
            LOG(msg: " reason: HTTP status 4xx クライアントエラー")
            logMessage = logMessage! + " " + nowTime! + "reason: HTTP status 4xx クライアントエラー"

        case MaioFailReason.networkServer: // HTTP status 5xx サーバーエラー
            LOG(msg: " reason:  HTTP status 5xx サーバーエラー")
            logMessage = logMessage! + " " + nowTime! + "reason:  HTTP status 5xx サーバーエラー"

        case MaioFailReason.sdk: // SDK エラー
            LOG(msg: " reason: SDK エラー")
            logMessage = logMessage! + " " + nowTime! + "reason: SDK エラー"

        case MaioFailReason.downloadCancelled: // クリエイティブダウンロードのキャンセル
            LOG(msg: " reason: クリエイティブダウンロードのキャンセル")
            logMessage = logMessage! + " " + nowTime! + "reason: reason: クリエイティブダウンロードのキャンセル"

        case MaioFailReason.videoPlayback: // 動画再生エラー
            LOG(msg: " reason: 動画再生エラー")
            logMessage = logMessage! + " " + nowTime! + "reason: 動画再生エラー"

        case MaioFailReason.unknown: // 不明なエラー
            LOG(msg: " reason: 不明なエラー")
            logMessage = logMessage! + " " + nowTime! + "reason: 不明なエラー"

        }
        
        
    }
    
    // 広告の配信可能状態が変更されたら呼ばれます。
    func maioDidChangeCanShow(_ zoneId: String!, newValue: Bool) {
        LOG_METHOD()
        LOG(msg: "広告の配信可能状態が変更された")
        LOG(msg: " zoneID  : \(zoneId)")
        LOG(msg: " newValue: \(newValue)")
        let nowTime = nowDateStr()
        logMessage = logMessage! + "\n" + nowTime! + "広告の配信可能状態が変更された"

    }
    
    // 広告の再生が終了したら呼ばれます。
    // 最初の再生終了時にのみ呼ばれ、リプレイ再生の終了時には呼ばれません。
    func maioDidFinishAd(_ zoneId: String!, playtime: Int, skipped: Bool, rewardParam: String!) {
        LOG_METHOD()
        LOG(msg: "広告の再生が終了")
        LOG(msg: " zoneID     : \(zoneId)")
        LOG(msg: " slipped    : \(skipped)")
        LOG(msg: " rewardParam: \(rewardParam)")
        let nowTime = nowDateStr()
        logMessage = logMessage! + "\n" + nowTime! + "広告の再生が終了"

    }

    func nowDateStr() -> String?{
        
        let formatter = DateFormatter()
        formatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd HH:mm:ss", options: 0, locale: Locale(identifier: "ja_JP"))
        
        return formatter.string(from: Date()) + " : "
    }

}



