//
//  ViewController.swift
//  KPTools
//
//  Created by kunpo on 2019/1/30.
//  Copyright © 2019 kunpo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    let array: [TagAttributedType] = [.background, .border, .pointedBackground, .pointedBorder]
    var index = 0
    
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
    
    @IBAction func changerTag(_ sender: UIButton) {
        let type = array[index % 4]
        let attStr = "测试标签".tag(font: 14, textColor: .red, tagColor: .green, type: type)
        self.label.attributedText = attStr
        index += 1
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
