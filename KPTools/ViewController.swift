//
//  ViewController.swift
//  KPTools
//
//  Created by kunpo on 2019/1/30.
//  Copyright © 2019 kunpo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let version = App.version
        let build = App.build
        let name = App.name
        let id = App.bundleId
        print("version: \(version ?? "nil")\nbuild: \(build ?? "nil")\nname: \(name ?? "nil")id: \(id ?? "nil")")
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        testTimerTools()
        let model = TestModel()
        let dic = transform(model)
        print("\(dic)")
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let _ = delay(2) {
            print("4秒后执行")
        }
    }
}


//MARK: Timer工具使用例子
extension ViewController {
    
    func testTimerTools() {
        //调用延时执行
        let block = delay(2) {
            print("2秒后执行")
        }
        
        //取消延时执行
        cancel(block)
    }
    
}

struct TestModel {
    var age = 5
    var names = ["", "22", "3"]
    var pp: [String : Any] = ["a" : "aa", "b" : 4]
}
