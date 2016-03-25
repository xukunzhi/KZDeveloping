//
//  KZRequestAPI.swift
//  KZDeveloping
//
//  Created by 许坤志 on 16/3/24.
//  Copyright © 2016年 许坤志. All rights reserved.
//

import Foundation
import Moya

public enum RequestApi {
    //  UserApi
    case login(loginName: String, password: String)
    case register(userMobile: String, password: String, inviteCode: String, verifyCode: String)
    //case accountInfo
    
    //  ProductApi
    case productList(pageSize: Int, curpage: Int, lastID: Int)
    //    case productDetail(id: Int)
}

extension RequestApi: TargetType {
    public var baseURL: NSURL {
        return NSURL(string: "http://apptest.wecube.com:8080/taojinjia/")!
    }
    
    public var path: String {
        switch self {
        case .login(_,_):
            return "services/crane/sso/login/doLogin"
        case .register(_,_,_,_):
            return "services/crane/sso/login/register"
        case let .productList(pageSize, curpage, lastID):
            return "services/creditor/product/list/page/"+String(pageSize)+"/"+String(curpage)+"/"+String(lastID)
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .login(_,_), .register:
            return .POST
        case .productList(_,_,_):
            return .GET
        }
    }
    
    public var parameters: [String: AnyObject]? {
        switch self {
        case let .login(loginName, password):
            return ["loginName": loginName, "userPassword": password]
        case let .register(userMobile, password, inviteCode, verifyCode):
            return ["userMobile": userMobile, "password": password, "inviteCode": inviteCode, "verifyCode": verifyCode]
        default :
            return nil
        }
    }
    
    //  单元测试用
    public var sampleData: NSData {
        return "{}".dataUsingEncoding(NSUTF8StringEncoding)!
    }
}