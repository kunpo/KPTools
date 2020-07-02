//
//  ViewShortcut.swift
//  STest
//
//  Created by kemp on 2020/6/23.
//  Copyright © 2020 kunpo. All rights reserved.
//

import UIKit

public extension UIView {
    @objc var KPX: CGFloat {
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
    }
    
    @objc var KPY: CGFloat {
        get {
            return frame.origin.y
        }
        set {
            frame.origin.y = newValue
        }
    }

    @objc var KPWidth: CGFloat {
        get {
            return frame.size.width
        }
        set {
            frame.size.width = newValue
        }
    }

    @objc var KPHeight: CGFloat {
        get {
            return frame.size.height
        }
        set {
            frame.size.height = newValue;
        }
    }

    @objc var KPTop: CGFloat {
        get {
            return self.KPY
        }
        set {
            self.KPY = newValue
        }
    }
    
    @objc var KPBottom: CGFloat {
        get {
            return self.frame.maxY
        }
        set {
            var rect = frame
            rect.size.height = newValue - self.KPY
            frame = rect
        }
    }
    
    @objc var KPLeft: CGFloat {
        get {
            return self.KPX
        }
        set {
            self.KPX = newValue
        }
    }

    @objc var KPRight: CGFloat {
        get {
            return self.frame.maxX
        }
        set {
            var rect = frame
            rect.size.width = newValue - self.KPLeft
            frame = rect
        }
    }
    
    @objc func KPViewController() -> UIViewController? {
        var iterate = next
        while let nextResponder = iterate {
            if let view = nextResponder as? UIView {
                iterate = view.next
            } else if let vc = nextResponder as? UIViewController {
                return vc
            } else if nextResponder is UINavigationController {
                return nil
            } else if nextResponder is UITableViewController {
                return nil
            }
        }
        
        return nil
    }

    @objc func KPNavigationController() -> UINavigationController? {
        var iterate = next
        while let nextResponder = iterate {
            if let nav = nextResponder as? UINavigationController {
                return nav
            } else {
                iterate = nextResponder.next
            }
        }
        return nil
    }

    @objc func KPTabBarController() -> UITableViewController? {
        var iterate = next
        while let nextResponder = iterate {
            if let tabBar = nextResponder as? UITableViewController {
                return tabBar
            } else {
                iterate = nextResponder.next
            }
        }
        return nil
    }

    ///xib里快捷设置，圆角
    @objc @IBInspectable var KPRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.clipsToBounds = true
            layer.cornerRadius = newValue
        }
    }
    
    ///xib里快捷设置，边框宽度
    @objc @IBInspectable var KPBorderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    ///xib里快捷设置，边框宽度
    @objc @IBInspectable var KPBorderColor: UIColor? {
        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}

