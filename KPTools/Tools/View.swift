//
//  View.swift
//  KPTools
//
//  Created by kunpo on 2019/2/14.
//  Copyright © 2019 kunpo. All rights reserved.
//  UIView的一些扩展

import UIKit

public extension UIView {
    
    ///获取view的Controller
    var viewController: UIViewController? {
        get {
            var nextResponder = self.next
            while let controller = nextResponder {
                if controller is UIViewController {
                    return (controller as! UIViewController)
                } else if controller is UIView {
                    nextResponder = controller.next
                } else if controller is UINavigationController {
                    return nil
                } else if controller is UITabBarController {
                    return nil
                } else {
                    return nil
                }
            }
            return nil
        }
    }
    
    ///获取view的navigationController
    var navigationController: UINavigationController? {
        get {
            var nextResponder = self.next
            while let nav = nextResponder {
                if nav is UINavigationController {
                    return (nav as! UINavigationController)
                }
                nextResponder = nav.next
            }
            return nil
        }
    }
    
    var tabBarController: UITabBarController? {
        get {
            var nextResponder = self.next
            while let nav = nextResponder {
                if nav is UITabBarController {
                    return (nav as! UITabBarController)
                }
                nextResponder = nav.next
            }
            return nil
        }
    }
    
}

extension UIView {
    @IBInspectable var bestRadius: CGFloat {
        set {
            self.clipsToBounds = true
            self.layer.cornerRadius = newValue
        }
        
        get {
            return self.layer.cornerRadius
        }
    }
    
    @IBInspectable var bestBorderWidth: CGFloat {
        set {
            self.layer.borderWidth = newValue
        }
        
        get {
            return self.layer.borderWidth
        }
    }
    
    @IBInspectable var bestBorderColor: UIColor? {
        set {
            self.layer.borderColor = newValue?.cgColor
        }
        
        get {
            guard let color = self.layer.borderColor else {
                return nil
            }
            let c = UIColor(cgColor: color)
            return c
        }
    }
}
