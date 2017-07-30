//
//  ViewController.swift
//  NetworkDemo
//
//  Created by Andrew on 2017/7/27.
//  Copyright © 2017年 Andrew. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let params: [String: String] = ["accesstoken": "",
                                        "teletext": "1",
                                        "page": "1",
                                        "limit": "20"]
        NetworkManager.postUrl("topic/info/58f821feee07cf0007f3bafb", params: params, success: { (testModel: TestModel?) in
            print(testModel?.contentStr)
        }, failure: { (msg) in
            print(msg)
        }) { (error) in
            print(error)
        }
        
        NetworkManager.postUrl("topic/info/58f821feee07cf0007f3bafb", params: params, success: { (model: BaseModel?) in
            print(model?.msg)
        }, failure: { (msg) in
            print(msg)
        }) { (error) in
            print(error)
        }
        
        NetworkManager.postNormalUrl("topic/info/58f821feee07cf0007f3bafb", params: params) { (data, error) in
            if let getData = data {
                let json = JSON(getData)
                let status = json["status"].intValue
                if status == 1 {
                    //封装model
                } else {
                    print(json["msg"].stringValue)
                }
            } else {
                print(error!)
            }
        }
        
        test()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func compareIntValue(_ a: Int, b: Int) -> Bool {
        return a == b
    }
    
    func compareDoubleValue(_ a: Double, b: Double) -> Bool {
        return a == b
    }
    
    func compareValue<T: Comparable>(_ a: T, b: T) -> Bool {
        return a == b
    }
    
    func test() -> Void {
        let _ = compareIntValue(3, b: 4)
        let _ = compareDoubleValue(3.0, b: 4.0)
        let result = compareValue("123", b: "456")
        print(result)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

