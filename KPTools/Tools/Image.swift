//
//  Image.swift
//  STest
//
//  Created by kemp on 2020/6/24.
//  Copyright © 2020 kunpo. All rights reserved.
//  UIImage的一些工具

import UIKit

public extension UIImage {
    
    //字符串转化二维码图片
    @objc static func qrImage(string: String?, size: CGSize, quality: String? = nil) -> UIImage? {
        guard let str = string, size != .zero else {
            return nil
        }
        guard let qrFilter: CIFilter = CIFilter(name: "CIQRCodeGenerator") else {
            return nil
        }
        let qrData = str.data(using: .isoLatin1)
        qrFilter.setValue(qrData, forKey: "inputMessage")
        let q = quality ?? "M"
        qrFilter.setValue(q, forKey: "inputCorrectionLevel")
        guard let ciImage = qrFilter.outputImage else {
            return nil
        }
        let imageSize = ciImage.extent.integral;
        let imge = ciImage.transformed(by: CGAffineTransform(scaleX: size.width/imageSize.width, y: size.height/imageSize.height))
        return UIImage(ciImage: imge)
    }
    
}
