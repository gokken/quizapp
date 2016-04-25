//
//  Color16RGBChoice.swift
//  QuizNursingCareApp
//
//  Created by 後藤健佑 on 2016/04/24.
//  Copyright © 2016年 後藤健佑. All rights reserved.
//

import UIKit

class Color16RGBChoice {
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}