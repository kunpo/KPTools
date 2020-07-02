//
//  Tag.swift
//  STest
//
//  Created by kemp on 2020/4/28.
//  Copyright © 2020 kunpo. All rights reserved.
//

import UIKit

///标签的样式
@objc public enum TagAttributedType: Int {
    ///边框
    case border
    ///背景
    case background
    ///左箭头边框
    case pointedBorder
    ///左箭头背景
    case pointedBackground
}

extension String {
    //这里添加一些标签的
    
    public func tag(font: CGFloat, textColor: UIColor, tagColor: UIColor, type: TagAttributedType) -> NSAttributedString {
        if self.count == 0 {
            return NSAttributedString(string: self)
        }
        let attach = NSTextAttachment()
        let attachImg = commonImage(font: UIFont.systemFont(ofSize: font), color: textColor, tagColor: tagColor, type: type)
//            UIImage(text: self, font: UIFont.systemFont(ofSize: font), color: textColor, tagColor: tagColor, type: type)
        let width = attachImg?.size.width ?? 5.0
        let height = attachImg?.size.height ?? 5.0
                attach.image = attachImg
        let frame = CGRect(x: 0, y: -1.0 * font / 4.0, width: width, height: height)
        attach.bounds = frame
        let res = NSAttributedString(attachment: attach)
        return res
    }
    
    func image(font: UIFont, color: UIColor, tagColor: UIColor, type: TagAttributedType) -> UIImage? {
        var size = self.size(withAttributes: [NSAttributedString.Key.font : font])
        let frame = CGRect(origin: CGPoint.zero, size: size)
        let label = UILabel(frame: frame)
        label.font = font
        label.text = self
        label.textColor = color
        label.textAlignment = .center
        
        var view: UIView = label
        let extend = size.height / 2.0
        size.width += extend
        size.height += extend
        switch type {
        case .background:
            view.bounds.size = size
            view.backgroundColor = tagColor
        case .border:
            view.bounds.size = size
            view.layer.borderColor = tagColor.cgColor
            view.layer.borderWidth = 1.0
            view.layer.cornerRadius = extend / 4.0
        default :
            view = TagBackground(subView: label, type: type, color: tagColor)
        }
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 1)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let res = UIGraphicsGetImageFromCurrentImageContext()
        return res
    }
    
    func commonImage(font: UIFont, color: UIColor, tagColor: UIColor, type: TagAttributedType) -> UIImage? {
        let textSize = self.size(withAttributes: [NSAttributedString.Key.font : font])
        let extend = textSize.height / 2.0
        var tagSize = CGSize(width: textSize.width + extend, height: textSize.height + extend)
        let rect = CGRect(origin: CGPoint.zero, size: tagSize)
        let origin = CGPoint(x: extend / 2.0, y: extend / 2.0)
        var textFrame = CGRect(origin: origin, size: textSize)
        var path: UIBezierPath!
        if type == .background || type == .border {
            UIGraphicsBeginImageContextWithOptions(tagSize, false, UIScreen.main.scale)
            path = UIBezierPath(roundedRect: rect, cornerRadius: extend / 2.0)
            if type == .background {
                tagColor.setFill()
                path.fill()
            } else {
                path.lineWidth = 1
                tagColor.setStroke()
                path.stroke()
            }
        } else {
            textFrame.origin.x = extend * 13 / 8.0
            tagSize.width += extend
            UIGraphicsBeginImageContextWithOptions(tagSize, false, UIScreen.main.scale)
            path = pointedBezierPath(size: tagSize)
            if type == .pointedBorder {
                path.lineWidth = 1
                tagColor.setStroke()
                path.stroke()
            } else {
                tagColor.setFill()
                path.fill()
            }
        }
        let attbibut: [NSAttributedString.Key : Any] = [NSAttributedString.Key.foregroundColor : color, NSAttributedString.Key.font : font]
        (self as NSString).draw(in: textFrame, withAttributes: attbibut)
        let res = UIGraphicsGetImageFromCurrentImageContext()
        return res
    }
    
    func pointedBezierPath(size: CGSize) -> UIBezierPath {
        let path = UIBezierPath()
        let h = size.height / 2
        path.move(to: CGPoint(x: 0, y: h))
        path.addLine(to: CGPoint(x: h, y: 2 * h))
        path.addLine(to: CGPoint(x: size.width, y: 2 * h))
        path.addLine(to: CGPoint(x: size.width, y: 0))
        path.addLine(to: CGPoint(x: h, y: 0))
        path.addLine(to: CGPoint(x: 0, y: h))
        path.close()
        return path
    }
}

extension UIImage {
    
    convenience init?(text: String, font: UIFont, color: UIColor, tagColor: UIColor, type: TagAttributedType) {
        var size = text.size(withAttributes: [NSAttributedString.Key.font : font])
        let frame = CGRect(origin: CGPoint.zero, size: size)
        let label = UILabel(frame: frame)
        label.font = font
        label.text = text
        label.textColor = color
        label.textAlignment = .center
        
        var view: UIView = label
        let extend = size.height / 2.0
        size.width += extend
        size.height += extend
        switch type {
        case .background:
            view.bounds.size = size
            view.backgroundColor = tagColor
        case .border:
            view.bounds.size = size
            view.layer.borderColor = tagColor.cgColor
            view.layer.borderWidth = 1.0
            view.layer.cornerRadius = extend / 4.0
        default :
            view = TagBackground(subView: label, type: type, color: tagColor)
        }
        
        self.init(fromView: view)
    }
    
    convenience init?(fromView view: UIView) {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, false, 1)
        view.layer.render(in: UIGraphicsGetCurrentContext()!)
        self.init(cgImage:(UIGraphicsGetImageFromCurrentImageContext()?.cgImage!)!)
        UIGraphicsEndImageContext()
    }
    
}

class TagBackground: UIView {
    
    var tagType = TagAttributedType.pointedBackground
    var tagColor = UIColor.clear
    
    convenience init(subView: UIView, type: TagAttributedType, color: UIColor) {
        let extend = subView.bounds.size.height / 4.0
        var frame = subView.bounds
        frame.size.width += extend * 4
        frame.size.height += extend * 2
        self.init(frame: frame)
        self.tagType = type
        self.tagColor = color
        subView.frame.origin.x = extend * 3
        subView.frame.origin.y = extend
        addSubview(subView)
    }
    
    override func draw(_ rect: CGRect) {
        if tagType == .pointedBorder || tagType == .pointedBackground {
            let y = frame.size.height / 2.0
            let path = UIBezierPath()
            path.move(to: CGPoint(x: 0, y: y))
            path.addLine(to: CGPoint(x: y, y: 2 * y))
            path.addLine(to: CGPoint(x: bounds.size.width, y: 2 * y))
            path.addLine(to: CGPoint(x: bounds.size.width, y: 0))
            path.addLine(to: CGPoint(x: y, y: 0))
            path.addLine(to: CGPoint(x: 0, y: y))
            path.close()
            let pathLayer = CAShapeLayer()
            if tagType == .pointedBorder {
                pathLayer.lineWidth = 1
                pathLayer.strokeColor = tagColor.cgColor
                pathLayer.fillColor = backgroundColor?.cgColor
            } else if tagType == .pointedBackground {
                pathLayer.fillColor = tagColor.cgColor
            }
            pathLayer.path = path.cgPath
            pathLayer.contentsScale = UIScreen.main.scale
            self.layer.insertSublayer(pathLayer, at: 0)
            
        }
        super.draw(rect)
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

///将字符串转化为标签的富文本
@objc public class AttributedStringTag: NSObject {
    ///将字符串转化为标签
    @objc public static func tag(str: String, font: CGFloat, textColor: UIColor, tagColor: UIColor, type: TagAttributedType) -> NSAttributedString {
        return str.tag(font: font, textColor: textColor, tagColor: tagColor, type: type)
    }
    
}
