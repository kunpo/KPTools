//
//  File.swift
//  KPTools
//
//  Created by kunpo on 2019/2/14.
//  Copyright © 2019 kunpo. All rights reserved.
//  沙盒、文件相关

import Foundation

///沙盒、文件相关
public struct File {
    ///Document文件路径
    public static var documentFilePath: String? {
        get {
            let documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
            if documents.count > 0 {
                return documents.first
            }
            return nil
        }
    }
    
    ///Library文件路径
    public static var libraryFilePath: String? {
        get {
            let libraries = NSSearchPathForDirectoriesInDomains(.libraryDirectory, .userDomainMask, true)
            if libraries.count > 0 {
                return libraries.first
            }
            return nil
        }
    }
    
    ///Cache文件路径
    public static var cacheFilePath: String? {
        get {
            let caches = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
            if caches.count > 0 {
                return caches.first
            }
            return nil
        }
    }
    ///Temp文件路径
    public static var tempFilePath: String {
        get {
            let temp = NSTemporaryDirectory()
            return temp
        }
    }
    
    ///判断文件夹是否存在
    public static func fileIsExited(filePath:String) -> Bool {
        let fileManager = FileManager.default
        let exist = fileManager.fileExists(atPath: filePath)
        return exist
    }
    
    //删除指定文件
    public static func deleteFile(filePath:String) {
        let fileManager = FileManager.default
        try? fileManager.removeItem(atPath: filePath)
    }
    
    //删除目录下所有的文件
    public static func deleteAllFileInDirectory(directory:String) {
        let fileManager = FileManager.default
        let fileArray = fileManager.subpaths(atPath: directory)
        for fn in fileArray!{
            try? fileManager.removeItem(atPath: directory + "/\(fn)")
        }
    }
}
