//
//  ConfigFile.swift
//  swiftDemo
//
//  Created by witaction on 2017/6/9.
//  Copyright © 2017年 witaction. All rights reserved.
//

import UIKit

let SCREENW:CGFloat = UIScreen.main.bounds.size.width
let SCREENH:CGFloat = UIScreen.main.bounds.size.height

// RECT 坐标
func Rect(x:CGFloat,y:CGFloat,w:CGFloat,h:CGFloat)->CGRect {return CGRect(x:x, y:y, width:w, height:h)}

// RGB 颜色
func RGB(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat) -> UIColor {
    return UIColor(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
}
