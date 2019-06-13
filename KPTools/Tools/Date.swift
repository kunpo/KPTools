//
//  Date.swift
//  KPTools
//
//  Created by kunpo on 2019/6/11.
//  Copyright © 2019 kunpo. All rights reserved.
//

import Foundation

extension Date {
    
    ///所在月的起始时间
    public func beginMonthDate() -> Date? {
        let calendar = Calendar.current
        var start = Date()
        let res = calendar.dateInterval(of: .month, start: &start, interval: nil, for: self)
        if res == true {
            return beginDate
        } else {
            return nil
        }
    }
    
    ///所在月的结束时间
    public func endMonthDate() -> Date? {
        let calendar = Calendar.current
        var start = Date()
        var interval: TimeInterval = 0
        let res = calendar.dateInterval(of: .month, start: &start, interval: &interval, for: self)
        if res == true {
            return start.addingTimeInterval(interval - 1.0)
        } else {
            return nil
        }
    }
    ///所在日的起始时间
    public func beginDate() -> Date? {
        let calendar = Calendar.current
        var start = Date()
        let res = calendar.dateInterval(of: .day, start: &start, interval: nil, for: self)
        if res == true {
            return beginDate
        } else {
            return nil
        }
    }
    ///所在日的结束时间
    public func endDate() -> Date? {
        let calendar = Calendar.current
        var start = Date()
        var interval: TimeInterval = 0
        let res = calendar.dateInterval(of: .day, start: &start, interval: &interval, for: self)
        if res == true {
            return start.addingTimeInterval(interval - 1.0)
        } else {
            return nil
        }
    }
    
    public func toString(format: String) -> String {
        var formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}
