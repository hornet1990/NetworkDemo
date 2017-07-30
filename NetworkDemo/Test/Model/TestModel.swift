//
//  TestModel.swift
//  NetworkDemo
//
//  Created by Andrew on 2017/7/27.
//  Copyright © 2017年 Andrew. All rights reserved.
//

import UIKit
import SwiftyJSON
import ObjectMapper

//class TestModel: BaseModel {
//    var contentStr: String?
//    var replyArray: [ReplyModel]?
//    var recommendArray: [RecommendModel]?
//    
//    required init(json: JSON) {
//        super.init(json: json)
//        if status == 1 {
//            let data = json["data"].dictionaryValue
//            contentStr = data["content"]?.string
//            let replies = data["replies"]?.array
//            let recommend = data["recommend"]?.array
//            if let reply = replies {
//                if reply.count > 0 {
//                    replyArray = [ReplyModel]()
//                    for data in reply {
//                        let replyModel = ReplyModel(json: data)
//                        replyArray?.append(replyModel)
//                    }
//                }
//            }
//            if let recom = recommend {
//                if recom.count > 0 {
//                    
//                }
//            }
//        }
//    }
//}

class TestModel: BaseModel {
    var contentStr: String?
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        status  <- map["status"]
        msg     <- map["msg"]
        contentStr <- map["data.content"]
    }
}
