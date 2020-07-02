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
