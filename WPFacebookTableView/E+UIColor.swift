//
//  E+UIColor.swift
//  WPFacebookTableView
//
//  Created by Alex on 13/12/20.
//

import Foundation
import UIKit

extension UIColor {
    static var random: UIColor {
        get {
            let r: CGFloat = CGFloat.random(in:  0 ..< 255) / 255
            let g: CGFloat = CGFloat.random(in:  0 ..< 255) / 255
            let b: CGFloat = CGFloat.random(in:  0 ..< 255) / 255
            return UIColor(red: r, green: g, blue: b, alpha: 1)
        }
    }
    
    static var top: UIColor {
        get {
            return UIColor.purple
        }
    }
    
    static var bottom: UIColor {
        get {
            return UIColor.blue
        }
    }
}

