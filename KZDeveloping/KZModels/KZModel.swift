//
//  KZModel.swift
//  KZDeveloping
//
//  Created by 许坤志 on 16/3/24.
//  Copyright © 2016年 许坤志. All rights reserved.
//

import Foundation
import ObjectMapper

class CommonInfo: Mappable {
    var data: AnyObject?
    var code: String!
    var msg: String?
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        data <- map["data"]
        code <- map["code"]
        msg <- map["mgs"]
    }
}

class ProductModel: Mappable {
    var activityType: Int?
    var amountUse: String?
    var productDesc: String?
    var productPublisher: PublisherModel!
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        activityType <- map["activityType"]
        amountUse <- map["amountUse"]
        productDesc <- map["productDesc"]
        productPublisher <- map["productPublisher"]
    }
}

class PublisherModel: Mappable {
    var age: Int?
    var userCode: String?
    var userMobile: String?
    var userId: String?
    required init?(_ map: Map) {
    }
    func mapping(map: Map) {
        age <- map["age"]
        userCode <- map["userCode"]
        userMobile <- map["userMobile"]
        userId <- map["userId"]
    }
}

class ShareInfo: Mappable {
    var title: String!
    var imagePath: String?
    var imageUrl: String?
    var content: String?
    var rowIdx: Int?
    
    required init?(_ map: Map) {
    }
    
    // Mappable
    func mapping(map: Map) {
        title <- map["title"]
        imagePath    <- map["imagePath"]
        imageUrl      <- map["imageUrl"]
        content       <- map["content"]
        rowIdx        <- map["rowIdx"]
    }
}