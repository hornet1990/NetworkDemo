//
//  BaseModel.swift
//  NetworkDemo
//
//  Created by Andrew on 2017/7/27.
//  Copyright © 2017年 Andrew. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

class BaseModel: Mappable {
    var status: Int?
    var msg: String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status  <- map["status"]
        msg     <- map["msg"]
    }
    
//    required init(json: JSON) {
//        status = json["status"].int
//        msg = json["msg"].string
//    }
}
