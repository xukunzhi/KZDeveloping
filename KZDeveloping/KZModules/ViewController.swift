//
//  ViewController.swift
//  KZDeveloping
//
//  Created by 许坤志 on 16/3/22.
//  Copyright © 2016年 许坤志. All rights reserved.
//

import UIKit
import ObjectMapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        MoyaRequest.sharedInstance.requestDataWithTarget(.productList(pageSize: 2, curpage: 0, lastID: 0), type: ProductModel.self, successClosure: { result in
            
            let dataList = Mapper<ProductModel>().mapArray(result["result"])
            print("Moya = \(dataList?[0].amountUse)  + \(dataList!.count)")
            
            }) { errorMsg in
                print(errorMsg)
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}