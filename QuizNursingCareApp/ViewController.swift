//
//  ViewController.swift
//  QuizNursingCareApp
//
//  Created by 後藤健佑 on 2016/03/18.
//  Copyright © 2016年 後藤健佑. All rights reserved.
//

import UIKit
import Foundation


class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    var csvArray = [String]()
    //var csvArray2 = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadCSVメソッドで配列csvArrayに読み込んだCSVファイルを格納
        csvArray = loadCSV("start")
        //ImageViewに画像を設定
        print(csvArray)
        let img:UIImage = UIImage(named:csvArray[0])!
        logoImageView.image = img
        //titleLabelにアプリ名を設定
        titleLabel.text = csvArray[1]
        //bodyTextViewにアプリ説明文を設定
        bodyTextView.text = csvArray[2]
        //ボタンのタイトル文字を白色に設定
        startbutton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        //creditLabelにクレジットを設定
        creditLabel.text = csvArray[3]
        // ボタンを配置する場所を設定する
       // startbutton.layer.position = CGPoint(x: self.view.frame.width/2, y:self.view.frame.height/2+50)
    }
    

    
    //CSVファイルの読み込みメソッド。引数にファイル名、返り値にString型の配列。
    func loadCSV(filename :String)->[String]{
        if let csvBundle = NSBundle.mainBundle().pathForResource(filename, ofType:"csv"){
        // ②エンコーディングに失敗した場合はcatchが実行。
        do {
            let csvData = try NSString(contentsOfFile: csvBundle, encoding: NSUTF8StringEncoding)
            // エンコーディングに成功した時の処理
            let lineChange = csvData.stringByReplacingOccurrencesOfString("\r", withString: "\n")
            //"\n"の改行コードで区切って、配列csvArrayに格納する
            csvArray = lineChange.componentsSeparatedByString("\n")
        } catch let error as NSError {
            // エンコーディング失敗時
            print(error)
        }
        }
        //配列に値を格納
        return csvArray
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

