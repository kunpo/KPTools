//
//  Timer.swift
//  KPTools
//
//  Created by kunpo on 2019/1/30.
//  Copyright © 2019 kunpo. All rights reserved.
//  与时间相关的一些工具

import Foundation

//MARK:-------------延时执行-----------------
/*
 一个延时执行的block，可以取消
*/
public typealias Task = (_ cancel: Bool) -> Void

public func delay(_ time: TimeInterval, task: @escaping () -> ()) -> Task? {
    
    func dispatchLater(block: @escaping () ->()) {
        let t = DispatchTime.now() + time
        DispatchQueue.main.asyncAfter(deadline: t, execute: block)
    }
    
    var closure:(() -> Void)? = task
    var result: Task?
    
    let delayedClosure: Task = {
        cancel in
        if let internalClosure = closure {
            if cancel == false {
                DispatchQueue.main.async(execute: internalClosure)
            }
        }
        closure = nil
        result = nil
    }
    result = delayedClosure
    dispatchLater {
        if let delayedClosure = result {
            delayedClosure(false)
        }
    }
    return result
}

public func cancel(_ task: Task?) {
    task?(true)
}
