//
//  KZAppDefine.swift
//  KZDeveloping
//
//  Created by 许坤志 on 16/3/29.
//  Copyright © 2016年 许坤志. All rights reserved.
//

import Foundation
import UIKit

let App_Delegate = UIApplication.sharedApplication().delegate as! AppDelegate

// MARK: - 屏幕宽高
let ScreenWidth: CGFloat = UIScreen.mainScreen().bounds.width
let ScreenHeight: CGFloat = UIScreen.mainScreen().bounds.height

// MARK: - 获取StroyBoard
func Get_Stroyboard(storyboardName: String) -> UIStoryboard {
    return UIStoryboard(name: storyboardName, bundle: NSBundle.mainBundle())
}

// MARK: - 颜色
func RGBA(r:CGFloat,_ g:CGFloat, _ b:CGFloat,_ a:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
}
func RGB(r:CGFloat,_ g:CGFloat, _ b:CGFloat) -> UIColor {
    return UIColor(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1.0)
}

// MARK: - 电池条颜色
func LightStatusBar() {
    UIApplication.sharedApplication().setStatusBarStyle(.LightContent, animated: true)
}
func BlackStatusBar() {
    UIApplication.sharedApplication().setStatusBarStyle(.Default, animated: true)
}

// MARK: 主题色
let ThemeColor = RGB(0, 130, 210)

// MARK: 延时操作
func GCD_Delay (second : NSTimeInterval ) -> dispatch_time_t {
    let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(second * Double(NSEC_PER_SEC)))
    return delay
}

// MARK: 字体大小
func FONT(size: CGFloat) -> UIFont {
    return UIFont.systemFontOfSize(size)
}

// MARK: 切圆角
func cutRoundWith(view : UIView) {
    let corner = view.width/2
    let shapeLayer = CAShapeLayer()
    let path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: .AllCorners, cornerRadii:CGSizeMake(corner,corner))
    shapeLayer.path = path.CGPath
    view.layer.mask = shapeLayer
}