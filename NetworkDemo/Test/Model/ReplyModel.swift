//
//  ReplyModel.swift
//  NetworkDemo
//
//  Created by Andrew on 2017/7/27.
//  Copyright © 2017年 Andrew. All rights reserved.
//

import UIKit
import SwiftyJSON

class ReplyModel: NSObject {
    var contentStr: String?
    var replyDate: String?
    
    init(json: JSON) {
        contentStr = json["content"].string
        replyDate = json["friendly_date"].string
    }
}
