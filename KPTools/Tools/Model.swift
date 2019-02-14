//
//  Model.swift
//  KPTools
//
//  Created by kunpo on 2019/2/12.
//  Copyright © 2019 kunpo. All rights reserved.
//  与Model相关的一些工具

import Foundation

/**将model转化为字典*/
public func transform(_ model: Any) -> [String : Any] {
    let mirror = Mirror(reflecting: model)
    var result = [String : Any]()
    
    func childChek(_ p: Any) -> Any {
        if p is Array<Any> {
            var tempA = [Any]()
            for item in p as! Array<Any> {
                tempA.append(childChek(item))
            }
            return tempA
        } else if p is [String : Any] {
            var tempD = [String : Any]()
            for (key, value) in p as! [String : Any] {
                tempD[key] = childChek(value)
            }
            return tempD
        } else {
            let childMirror = Mirror(reflecting: p)
            if let display = childMirror.displayStyle {
                switch display {
                case .class, .struct:
                    return transform(p)
                default:
                    return "\(p)"
                }
            } else {
                return "\(p)"
            }
        }
    }
    for case let (key?, value) in mirror.children {
        result[key] = childChek(value)
    }
    return result
}
