//
//  ScoreViewController.swift
//  QuizNursingCareApp
//
//  Created by 後藤健佑 on 2016/03/18.
//  Copyright © 2016年 後藤健佑. All rights reserved.
//

import UIKit
import Social

class ScoreViewController: UIViewController {
    //KenteiViewControllerの正解数を受け取るメンバ変数
    var correct = 0
    // 計算の値を入れ込む変数
    var keisan = 0
    // 問題数を引き継ぐ変数
    var totalvalue = 0
    // 正解数を表示するラベル
    @IBOutlet var scoreLabel: UILabel!
    // 合格 or 不合格画像を表示する画像
    @IBOutlet var judgeImageView: UIImageView!
    // 合格数を表示する変数
    @IBOutlet weak var goukakuTimesLabel: UILabel!
    // ランクを表示する変数
    @IBOutlet weak var rankLabel: UILabel!
    // 合格回数を格納する変数
    var goukakuTimes1 = 0
    // 称号変数。初期値はビギナー
    var rankString = "ビギナー"
    // 最後に回数を格納する変数
    var goukakubox = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //合格回数を保存するNSUserDefaults
        let goukakuUd = NSUserDefaults.standardUserDefaults()
        // 合格回数をgoukakuと言うキー値で変数goukakuTimesに格納
        goukakuTimes1 = goukakuUd.integerForKey("goukaku")
        // 正解数の計算
        keisan = correct * 10 / totalvalue
        //正解数を表示
        scoreLabel.text = "正解数は\(correct)問です"
        //合格・不合格を判定
        if keisan >= 5{
            judgeImageView.image = UIImage(named: "Goukaku2.png")!
            // 合格回数をカウントアップ
            goukakuTimes1++
            // goukakuキー値を使って合格回数(goukakuTimes)を保存
            goukakuUd.setInteger(goukakuTimes1, forKey: "goukaku")
        }else{
            judgeImageView.image = UIImage(named: "Fugoukaku.png")!
        }
        goukakuTimesLabel.text = "合格回数は\(goukakuTimes1)回です。"
        goukakubox = goukakuTimes1
        // 合格回数によってランクを決定
        if goukakubox >= 50{
            rankString = "達人"
        }else if goukakubox >= 40{
            rankString = "師匠"
        }else if goukakubox >= 30{
            rankString = "師範代"
        }else if goukakubox >= 20{
            rankString = "上級者"
        }else if goukakubox >= 10{
            rankString = "ファン"
        }else if goukakubox >= 0{
            rankString = "ビギナー"
        }
        // ランクレベルに称号を設定
        rankLabel.text = "ランクは\(rankString)!"
    }
    // Facebook 投稿メソッド
    @IBAction func postFacebook(sender: AnyObject) {
      // Facebook 投稿用インスタンスを作成
        let fbVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        // 投稿テキストを設定
        fbVC.setInitialText("介護検定:私は\(rankString)。合格回数は\(goukakubox)回です。")
        // 投稿画像を設定
        //fbVC.addImage(UIImage(named:"icon.png"))
        // 投稿用URLを設定
        //fbVC.addURL(NSURL(string:"http://onthehammock.com/app/5783"))
        // 投稿コントローラーを起動
        self.presentViewController(fbVC, animated: true, completion: nil)
    }
    // Twitter投稿メソッド
    @IBAction func postTwitter(sender: AnyObject) {
        // Twitter投稿用インスタンスを作成
        let twVC:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        // 投稿テキストを設定
        twVC.setInitialText("介護検定:私は\(rankString)。合格回数は\(goukakubox)回です。")
        // 投稿画像を設定
        //twVC.addImage(UIImage(named:"icon.png"))
        // 投稿用URLを設定
        //twVC.addURL(NSURL(string:"http://onthehammock.com/app/5783"))
        // 投稿コントローラーを起動
        self.presentViewController(twVC, animated: true, completion: nil)
 
    }
    
}
