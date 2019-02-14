//
//  App.swift
//  KPTools
//
//  Created by kunpo on 2019/2/14.
//  Copyright © 2019 kunpo. All rights reserved.
//  获取app相关信息的工具

import Foundation

///获取app相关信息的工具
public struct App {
    ///App的版本号
    public static var version: String? {
        get {
            let infoDic = Bundle.main.infoDictionary
            let version = infoDic?["CFBundleShortVersionString"] as? String
            return version
        }
    }
    
    ///App的build号
    public static var build: String? {
        get {
            let infoDic = Bundle.main.infoDictionary
            let build = infoDic?["CFBundleVersion"] as? String
            return build
        }
    }
    
    ///App的名称
    public static var name: String? {
        get {
            //⚠️如果info里没有设置Bundle display name则返回的是nil
            let infoDic = Bundle.main.infoDictionary
            let name = infoDic?["CFBundleDisplayName"] as? String
            return name
        }
    }
    
    ///App的标识符
    public static var bundleId: String? {
        get {
            let id = Bundle.main.bundleIdentifier
            return id
        }
    }
}
