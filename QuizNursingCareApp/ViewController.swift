//
//  ViewController.swift
//  QuizNursingCareApp
//
//  Created by 後藤健佑 on 2016/03/18.
//  Copyright © 2016年 後藤健佑. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var startbutton: UIButton!
    @IBOutlet weak var creditLabel: UILabel!
    var csvArray = [String]()
    var colorChoice = Color16RGBChoice()
    //var csvArray2 = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadCSVメソッドで配列csvArrayに読み込んだCSVファイルを格納
        csvArray = loadCSV("start")
        //ImageViewに画像を設定
        let img:UIImage = UIImage(named:csvArray[0])!
        logoImageView.image = img
        //ボタンのタイトル文字を白色に設定
        startbutton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        // ボタンの背景色を設定する
        startbutton.backgroundColor = colorChoice.UIColorFromRGB(0x20b2aa)
        //creditLabelにクレジットを設定
        creditLabel.text = csvArray[1]
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

