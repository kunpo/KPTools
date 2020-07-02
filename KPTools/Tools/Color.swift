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
    class func hexValue(hex :Int, alpha: CGFloat = 1.0) -> UIColor {
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
    class func rgbValue(red:CGFloat, green:CGFloat, blue:CGFloat, alpha: CGFloat = 1.0) -> UIColor {
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

//这些颜色和xib里配置的会有色差，xib里的默认标准是RGB，使用代码是sRGB
public extension UIColor {
    @objc convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        self.init(hex: color, alpha: alpha)
    }

   @objc convenience init(hex: UInt32, alpha: CGFloat = 1.0) {
        let r = (hex & 0xFF0000) >> 16
        let g = (hex & 0x00FF00) >>  8
        let b = hex & 0x0000FF
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    
}
