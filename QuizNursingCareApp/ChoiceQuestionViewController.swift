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
    var mondaivalue = 0
    @IBOutlet var scrollView: UIScrollView!//最上位のスクロールビュー
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 1200)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let menusVC = segue.destinationViewController as! KenteiViewController
        menusVC.menuvalue = menubeforevalue
        menusVC.total = mondaivalue
    }
    @IBAction func Btn1Action(sender: AnyObject) {
        //Storyboard SegueのIdentifierを引数に設定して画面遷移
        menubeforevalue = 1
        mondaivalue = 2
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn2Action(sender: AnyObject) {
        menubeforevalue = 2
        mondaivalue = 2
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn3Action(sender: AnyObject) {
        menubeforevalue = 3
        mondaivalue = 12
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn4Action(sender: AnyObject) {
        menubeforevalue = 4
        mondaivalue = 16
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn5Action(sender: AnyObject) {
        menubeforevalue = 5
        mondaivalue = 8
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn6Action(sender: AnyObject) {
        menubeforevalue = 6
        mondaivalue = 20
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn7Action(sender: AnyObject) {
        menubeforevalue = 7
        mondaivalue = 8
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn8Action(sender: AnyObject) {
        menubeforevalue = 8
        mondaivalue = 8
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn9Action(sender: AnyObject) {
        menubeforevalue = 9
        mondaivalue = 10
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn10Action(sender: AnyObject) {
        menubeforevalue = 10
        mondaivalue = 10
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn11Action(sender: AnyObject) {
        menubeforevalue = 11
        mondaivalue = 12
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    @IBAction func Btn12Action(sender: AnyObject) {
        menubeforevalue = 12
        mondaivalue = 12
        performSegueWithIdentifier("SelectSegue", sender: nil)
    }
    


}