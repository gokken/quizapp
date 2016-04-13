//
//  KenteiViewController.swift
//  QuizNursingCareApp
//
//  Created by 後藤健佑 on 2016/03/18.
//  Copyright © 2016年 後藤健佑. All rights reserved.
//

import UIKit

class KenteiViewController: UIViewController {
    
    @IBOutlet weak var mondaiNumberLabel: UILabel!
    @IBOutlet weak var mondaiTextView: UITextView!
    @IBOutlet weak var answerBtn1: UIButton!
    @IBOutlet weak var answerBtn2: UIButton!
    @IBOutlet weak var answerBtn3: UIButton!
    @IBOutlet weak var answerBtn4: UIButton!
    @IBOutlet weak var answerBtn5: UIButton!
    @IBOutlet weak var judgeImageView: UIImageView!
    @IBOutlet var kenteiscrollview: UIScrollView!
    // kentei.csvファイルを格納する解列csvArray
    var csvArray = [String]()
    // csvArrayから取り出した問題を格納する配列mondaiArray
    var mondaiArray = [String]()
    
    var mondaiCount = 0      //問題をカウントする変数
    var correctCount = 0     //正解をカウントする変数
    let total = 8           //出題数を管理する定数
    // 正解&解説バックグラウンド画像
    var kaisetsuBGImageView = UIImageView()
    // 解説バックグラウンド画像のX座標
    var kaisetsuBGX = 0.0
    // 正解表示ラベル
    var seikaiLabel = UILabel()
    // 解説テキストビュー
    var kaisetsuTextView = UITextView()
    // バックボタン
    var backBtn = UIButton()
    // メニューから値を引数として受け取る
    var menuvalue = 0
    
    //viewDidLoadメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        // kenteiscrollviewの初期設定
        kenteiscrollview.contentSize = CGSizeMake(self.view.frame.size.width, 800)
        
        //バックグラウンド画像をセット
        kaisetsuBGImageView.image = UIImage(named: "kaisetsuBG.png")
        //画面サイズを取得
        let screenSize:CGSize = (UIScreen.mainScreen().bounds.size)
        //解説バックグラウンド画像のx座標(画面の中央になるように設定)
        kaisetsuBGX = Double(screenSize.width/2) - 320/2
        
        //フレームを設定。Y座標に画面の縦サイズを設定して、画面の外に設置する
        kaisetsuBGImageView.frame = CGRect(x: kaisetsuBGX, y: 1000, width: 320, height: 210)
        
        
        //画面上のタッチ操作を可能にする
        kaisetsuBGImageView.userInteractionEnabled = true
        //画面をviewに配置
        self.view.addSubview(kaisetsuBGImageView)
        
        // 正解表示ラベルのフレームを設定
        seikaiLabel.frame = CGRect(x: 10, y: 5, width: 300, height: 30)
        // 正解ラベルのアラインメントをセンターに設定
        seikaiLabel.textAlignment = .Center
        // 正解ラベルのフォントサイズを15ポイント設定
        seikaiLabel.font = UIFont.systemFontOfSize(CGFloat(15))
        // 正解ラベルを解説バックグラウンド画像に配置
        kaisetsuBGImageView.addSubview(seikaiLabel)
        
        //解説テキストビューのフレームを設定
        kaisetsuTextView.frame = CGRect(x: 10, y: 40, width: 300, height: 140)
        // 解説テキストビューの背景色を透明に設定
        kaisetsuTextView.backgroundColor = UIColor.clearColor()
        //解説テキストビューのフォントサイズを17ポイントに設定
        kaisetsuTextView.font = UIFont.systemFontOfSize(CGFloat(17))
        //解説テキストビューを編集できないようにする
        kaisetsuTextView.editable = false
        // 解説テキストビューを解説バックグラウンド画像に配置
        kaisetsuBGImageView.addSubview(kaisetsuTextView)
        
        
        // バックボタンのフレームを設定
        backBtn.frame = CGRect(x: 10, y: 180, width: 300, height: 30)
        // バックボタンに通常時と押下時の画像を設定
        backBtn.setImage(UIImage(named: "kenteiBack.png"), forState: .Normal)
        backBtn.setImage(UIImage(named: "kenteiBackOn.png"), forState: .Highlighted)
        // バックボタンにアクションを設定
        backBtn.addTarget(self, action: "backBtnTapped", forControlEvents: UIControlEvents.TouchUpInside)
        // バックボタンを解説バックグラウンド画像に配置
        kaisetsuBGImageView.addSubview(backBtn)

        // ViewControllerのインスタンスを作成
        let viewController = ViewController()
        //loadCSVメソッドを使用し、csvArrayに検定問題を格納
        csvArray = viewController.loadCSV("kentei5")
        
        //csvArrayの0行目を取り出し、カンマを区切りとしてmondaiArrayに格納
        mondaiArray = csvArray[mondaiCount].componentsSeparatedByString(",")
        // 変数mondaiCountに1を足してラベルに出題数を設定
        mondaiNumberLabel.text = "第\(mondaiCount+1)問"
        // TextViewに問題を設定
        mondaiTextView.text = mondaiArray[0]
        // 選択肢ボタンのタイトルに選択肢を設定
        answerBtn1.setTitle(mondaiArray[2],forState: .Normal)
        answerBtn2.setTitle(mondaiArray[3],forState: .Normal)
        answerBtn3.setTitle(mondaiArray[4],forState: .Normal)
        answerBtn4.setTitle(mondaiArray[5],forState: .Normal)
        answerBtn5.setTitle(mondaiArray[6],forState: .Normal)
        // 選択肢ボタンのタグを設定
        answerBtn1.tag = 0
        answerBtn2.tag = 1
        answerBtn3.tag = 2
        answerBtn4.tag = 3
        answerBtn5.tag = 4
    }
    
    @IBAction func btnAction(sender: UIButton){
        //正解番号とボタンのtagが同じなら正解(.Int()を使ってInt型にキャスト)
        print(sender.tag)
        if sender.tag == Int(mondaiArray[1]){
            // ◯を表示
            judgeImageView.image = UIImage(named: "maru.png")
            // 正解カウントを増やす
            correctCount++
        }else{
            //間違っていたら×を表示
            judgeImageView.image = UIImage(named: "batsu.png")
        }
        //judgeImageViewを表示
        judgeImageView.hidden = false
        //kaisetsuメソッド呼び出し
        kaisetsu()
    }
    // 次の問題を表示するメソッド
    func nextProblem(){
        //問題カウント変数をカウントアップ
        mondaiCount++
        //mondaiArrayに格納されている問題配列を削除
        mondaiArray.removeAll(keepCapacity: true)
        //if-else文を追加。mondaiCountがtotalに達したら画面遷移
        if mondaiCount < total{
        //csvArrayから次の問題配列をmondaiArrayに格納
        mondaiArray = csvArray[mondaiCount].componentsSeparatedByString(",")
        //問題ラベル、問題表示テキストビュー、選択肢ボタンを情報にセット
        mondaiNumberLabel.text = "第\(mondaiCount+1)問"
        mondaiTextView.text = mondaiArray[0]
        answerBtn1.setTitle(mondaiArray[2],forState: .Normal)
        answerBtn2.setTitle(mondaiArray[3],forState: .Normal)
        answerBtn3.setTitle(mondaiArray[4],forState: .Normal)
        answerBtn4.setTitle(mondaiArray[5],forState: .Normal)
        answerBtn5.setTitle(mondaiArray[6],forState: .Normal)
        }else{
            //Storyboard SegueのIdentifierを引数に設定して画面遷移
            performSegueWithIdentifier("score", sender: nil)
        }
    }
    // 解説表示メソッド
    func kaisetsu(){
        // 正解表示ラベルのテキストをmondaiArrayから取得
        seikaiLabel.text = mondaiArray[7]
        // 解説テキストビューのテキストをmondaiArrayから取得
        kaisetsuTextView.text = mondaiArray[8]
        // answerBtn1のy座標取得
        let answerBtnY = answerBtn1.frame.origin.y
        //解説バックグラウンド画像を表示させるアニメーション
        UIView.animateWithDuration(0.5, animations: {() -> Void in self.kaisetsuBGImageView.frame = CGRect(x: self.view.bounds.width/2 - 320/2, y: answerBtnY, width: 320, height: 210);})
        // 選択ボタンの使用停止
        answerBtn1.enabled = false
        answerBtn2.enabled = false
        answerBtn3.enabled = false
        answerBtn4.enabled = false
        answerBtn5.enabled = false
    }
    // バックボタンメソッド
    func backBtnTapped(){
        // 解説バックグラウンド画像を枠外に移動させるアニメーション
        UIView.animateWithDuration(0.5, animations: {() -> Void in self.kaisetsuBGImageView.frame = CGRect(x: 0, y: 1000, width: 320, height: 210);})
        
        //選択ボタンの使用を再開
        answerBtn1.enabled = true
        answerBtn2.enabled = true
        answerBtn3.enabled = true
        answerBtn4.enabled = true
        answerBtn5.enabled = true
        
        //正誤表示画像を隠す
        judgeImageView.hidden = true
        //nextProblemメソッドを呼び出す
        nextProblem()
    }
    //得点画面へ値を渡す
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let sVC = segue.destinationViewController as! ScoreViewController
        sVC.correct = correctCount
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
