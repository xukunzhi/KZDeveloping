//
//  UIViewExtension.swift
//  KZDeveloping
//
//  Created by 许坤志 on 16/3/29.
//  Copyright © 2016年 许坤志. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    // MARK: View position by x & y
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame = CGRect(x: newValue, y: self.frame.origin.y, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: newValue, width: self.frame.size.width, height: self.frame.size.height)
        }
    }
    
    // MARK: View width & height
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: newValue, height: self.frame.size.height)
        }
    }
    
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame = CGRect(x: self.frame.origin.x, y: self.frame.origin.y, width: self.frame.size.width, height: newValue)
        }
    }
    
    // MARK: Place view
    class func placeViewBelowViewWithPadding(addView: UIView, belowView: UIView, padding: CGFloat) {
        
        var addViewFrame : CGRect = addView.frame
        addViewFrame.origin.y = CGRectGetMaxY(belowView.frame) + padding
        addView.frame = addViewFrame
    }
    
    class func placeViewBelowAndCenterWithPadding(addView: UIView, fixedView: UIView, padding: CGFloat) {

        var addViewFrame: CGRect = addView.frame
        addView.center = fixedView.center
        addViewFrame.origin.y = CGRectGetMaxY(fixedView.frame) + padding
        addView.frame = addViewFrame
        
    }
    
    
    class func placeViewRightFromViewWithPadding(addView: UIView, rightView: UIView, padding: CGFloat) {
        
        var addViewFrame: CGRect = addView.frame
        addViewFrame.origin.x = CGRectGetMaxX(rightView.frame) + padding
        addView.frame = addViewFrame
    }
    
    
    class func placeViewRightFromViewAndCenterWithPadding(addView: UIView, fixedView: UIView, padding: CGFloat) {
        
        var addViewFrame: CGRect = addView.frame
        addView.center = fixedView.center;
        addViewFrame.origin.x = CGRectGetMaxX(fixedView.frame) + padding
        addView.frame = addViewFrame
    }
    
    // MARK: Origin & size
    func setOriginForView(origin: CGPoint, view: UIView) {
        var frame: CGRect = view.frame
        frame.origin = origin
        view.frame = frame
    }
    
    func setSizeForView(size: CGSize, view: UIView) {
        var frame: CGRect = view.frame
        frame.size = size
        view.frame = frame
    }
    
    class func setXandYForView(x: CGFloat, y:CGFloat, view: UIView) {
        var frame: CGRect = view.frame
        frame.origin = CGPointMake(x, y)
        view.frame = frame
    }
    
    class func setWidthAndHeightForView(width: CGFloat, height: CGFloat, view: UIView) {
        var frame: CGRect = view.frame
        frame.size = CGSizeMake(width, height)
        view.frame = frame
    }
    
    // MARK: Remove allSubView in view
    func removeAllSubViews() {
        for subView :AnyObject in self.subviews { subView.removeFromSuperview() }
    }
}