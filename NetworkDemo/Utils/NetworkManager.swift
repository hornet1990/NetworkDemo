//
//  NetworkManager.swift
//  NetworkDemo
//
//  Created by Andrew on 2017/7/27.
//  Copyright © 2017年 Andrew. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

let BaseUrl = ""

class NetworkManager: NSObject {
    //使用泛型的网络请求
    static func postUrl<T: BaseModel>(_ url: String, params: [String: String]?, success: @escaping (_ model: T?) -> (), failure: @escaping (_ msg: String?) -> (), error: @escaping (_ error: Error?) -> ()) {
        let requestUrl = BaseUrl + url
        Alamofire.request(requestUrl, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.isSuccess {
                if let getData = response.result.value {
//                    let json = JSON(getData)
//                    let model = T(json: json)
                    let getModel = Mapper<T>().map(JSONObject: getData)
                    if getModel?.status == 1 {
                        success(getModel)
                    } else {
                        failure(getModel?.msg)
                    }
                }
            } else {
                error(response.result.error)
            }
        }
    }
    
    //原网络请求
    static func postNormalUrl(_ url: String, params: [String: String]?, completion: @escaping (_ data: Any?, _ error: Error?) -> ()) {
        let requestUrl = BaseUrl + url
        Alamofire.request(requestUrl, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            if response.result.isSuccess {
                completion(response.result.value, nil)
            } else {
                completion(nil, response.result.error)
            }
        }
    }
}
