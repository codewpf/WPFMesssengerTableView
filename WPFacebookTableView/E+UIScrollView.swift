//
//  E+UIScrollView.swift
//  WPFacebookTableView
//
//  Created by Alex on 17/12/20.
//

import Foundation
import UIKit


// *头部视图指针
private var headerPointer: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: 2)
// *底部视图指针
private var footerPointer: UnsafeRawPointer! = UnsafeRawPointer(bitPattern: 3)

extension UIScrollView {
    /// 刷新头视图
    var headerView: UIView? {
        get {
            let header = objc_getAssociatedObject(self, headerPointer) as? UIView
            return header
        }
        set {
            if let oldValue = objc_getAssociatedObject(self, headerPointer) as? UIView {
                oldValue.removeFromSuperview()
            }
            self.setHeader(newValue)
            objc_setAssociatedObject(self, headerPointer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    /// 刷新底视图
    var footerView: UIView? {
        get {
            let footer = objc_getAssociatedObject(self, footerPointer) as? UIView
            return footer
        }
        set {
            if let oldValue = objc_getAssociatedObject(self, footerPointer) as? UIView {
                oldValue.removeFromSuperview()
            }
            self.setFooter(newValue)
            objc_setAssociatedObject(self, footerPointer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    private func setHeader(_ header: UIView?) {
        
    }
    
    private func setFooter(_ header: UIView?) {
        
    }

    
}
