//
//  KZNetwork.swift
//  KZDeveloping
//
//  Created by 许坤志 on 16/3/25.
//  Copyright © 2016年 许坤志. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import SwiftyJSON
import ObjectMapper


typealias SuccessClosure = (result: AnyObject) -> Void
typealias FailClosure = (errorMsg: String?) -> Void

enum RequestCode: String {
    case failError = "0"
    case success = "1"
}

class MoyaRequest {
    // swift中单行单例方法
    static let sharedInstance = MoyaRequest()
    private init() {}
    
    let requestProvider = RxMoyaProvider<RequestApi>()
    
    func requestDataWithTarget<T: Mappable>(target: RequestApi, type: T.Type, successClosure: SuccessClosure, failClosure: FailClosure) {
        let _ = requestProvider.request(target).subscribe { (event) -> Void in
            switch event {
            case .Next(let response):
                let info = Mapper<CommonInfo>().map(JSON(data: response.data, options: .AllowFragments).object)
                guard info?.code == RequestCode.success.rawValue else {
                    failClosure(errorMsg: info?.msg)
                    return
                }
                guard let data = info?.data else {
                    failClosure(errorMsg: "数据为空...")
                    return
                }
                successClosure(result: data)
            case .Error(let error):
                print("网络请求失败...\(error)")
            default:
                break
            }
        }
    }
}

extension Observable {
    
}