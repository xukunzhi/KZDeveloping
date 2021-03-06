//
//  UIScrollView+Rx.swift
//  RxCocoa
//
//  Created by Krunoslav Zaher on 4/3/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

#if os(iOS) || os(tvOS)

import Foundation
#if !RX_NO_MODULE
import RxSwift
#endif
import UIKit

extension UIScrollView {
    
    /**
    Factory method that enables subclasses to implement their own `rx_delegate`.
    
    - returns: Instance of delegate proxy that wraps `delegate`.
    */
    public func rx_createDelegateProxy() -> RxScrollViewDelegateProxy {
        return RxScrollViewDelegateProxy(parentObject: self)
    }
    
    /**
    Reactive wrapper for `delegate`.
    
    For more information take a look at `DelegateProxyType` protocol documentation.
    */
    public var rx_delegate: DelegateProxy {
        return proxyForObject(RxScrollViewDelegateProxy.self, self)
    }
    
    /**
    Reactive wrapper for `contentOffset`.
    */
    public var rx_contentOffset: ControlProperty<CGPoint> {
        let proxy = proxyForObject(RxScrollViewDelegateProxy.self, self)

        let bindingObserver = UIBindingObserver(UIElement: self) { scrollView, contentOffset in
            scrollView.contentOffset = contentOffset
        }

        return ControlProperty(values: proxy.contentOffsetSubject, valueSink: bindingObserver)
    }
    
    /**
    Installs delegate as forwarding delegate on `rx_delegate`.
    
    It enables using normal delegate mechanism with reactive delegate mechanism.
    
    - parameter delegate: Delegate object.
    - returns: Disposable object that can be used to unbind the delegate.
    */
    public func rx_setDelegate(delegate: UIScrollViewDelegate)
        -> Disposable {
        let proxy = proxyForObject(RxScrollViewDelegateProxy.self, self)
        return installDelegate(proxy, delegate: delegate, retainDelegate: false, onProxyForObject: self)
    }
}

#endif
