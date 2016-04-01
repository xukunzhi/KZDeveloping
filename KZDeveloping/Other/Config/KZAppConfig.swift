//
//  KZAppConfig.swift
//  KZDeveloping
//
//  Created by 许坤志 on 16/3/28.
//  Copyright © 2016年 许坤志. All rights reserved.
//
import Foundation

struct Keys {
    static let launchImageKey = "launchImageKey"
    static let launchTextKey = "launchTextKey"
    static let readNewsId = "readNewsId"
}

// MARK: 调试日志
func ZPRINT<T>(object: T, _ file: String = #file, _ function: String = #function, _ line: Int = #line) {
    #if DEBUG
        var filename:String! = NSURL(fileURLWithPath: file).lastPathComponent?.URLString
        filename = filename.stringByReplacingOccurrencesOfString(".swift", withString: "_", options: NSStringCompareOptions.LiteralSearch, range: nil)
        print("\(filename)_\(function)[\(line)]: \(object)\n", terminator: "")
    #endif
}

#if (arch(i386) || arch(x86_64)) && (os(iOS) || os(watchOS) || os(tvOS))
let TARGET_IPHONE_SIMULATOR = true
#else
let TARGET_IPHONE_SIMULATOR = false
#endif
