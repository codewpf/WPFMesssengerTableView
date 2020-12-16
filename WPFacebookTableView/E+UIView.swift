//
//  E+UIView.swift
//  WPFacebookTableView
//
//  Created by Alex on 17/12/20.
//

import Foundation
import UIKit

extension UIView: ViewGradientColorable {}


protocol ViewGradientColorable {}
extension ViewGradientColorable  {

    func gradientlayer(with top: UIColor, bottom: UIColor, superView: UIView, cornerRadius: CGFloat = 0) {
        if let sublayers = superView.layer.sublayers {
           _ = sublayers.map { if $0.name == "gradientlayer" {$0.removeFromSuperlayer()} }
        }
        
        let gradientColors = [top.cgColor, bottom.cgColor]
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.cornerCurve = .continuous
        gradientLayer.colors = gradientColors
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        gradientLayer.name = "gradientlayer"
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            gradientLayer.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: superView.frame.size)
            superView.layer.insertSublayer(gradientLayer, at: 0)
        }
        
    }

}

