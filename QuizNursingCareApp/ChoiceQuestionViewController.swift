//
//  ChoiceQuestion.swift
//  QuizNursingCareApp
//
//  Created by 後藤健佑 on 2016/03/18.
//  Copyright © 2016年 後藤健佑. All rights reserved.
//

import UIKit

class ChoiceQuestionViewController: UIViewController {
    var menubeforevalue = 0
    @IBOutlet var scrollView: UIScrollView!//最上位のスクロールビュー
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1200)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menusVC = segue.destinationViewController as! KenteiViewController
        menusVC.menuvalue = menubeforevalue
    }
    @IBAction func Btn1Action(sender: AnyObject) {
        //Storyboard SegueのIdentifierを引数に設定して画面遷移
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }

}
