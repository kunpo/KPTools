//
//  Color.swift
//  KPTools
//
//  Created by kunpo on 2019/2/14.
//  Copyright © 2019 kunpo. All rights reserved.
//  UIColor的一些扩展

import UIKit

public extension UIColor {
    ///16进制的色值
    public class func hexValue(hex :Int, alpha: CGFloat = 1.0) -> UIColor {
        if hex < 0 {
            return UIColor.black
        }
        var al = alpha
        if (alpha > 1.0) || (alpha < 0) {
            al = 1.0
        }
        let red: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / CGFloat(255.0)
        let green: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat(hex & 0x0000FF) / 255.0
        return UIColor(red:red , green: green, blue: blue, alpha: al)
    }
    
    ///RGB 0-255之间
    public class func rgbValue(red:CGFloat, green:CGFloat, blue:CGFloat, alpha: CGFloat = 1.0) -> UIColor {
        var al = alpha
        if (alpha > 1.0) || (alpha < 0) {
            al = 1.0
        }
        let r = red / 255.0
        let g = green / 255.0
        let b = blue / 255.0
        return UIColor(red:r , green: g, blue: b, alpha: al)
    }
}
