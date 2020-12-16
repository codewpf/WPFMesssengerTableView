//
//  E+CALayer.swift
//  WPFacebookTableView
//
//  Created by Alex on 16/12/20.
//

import Foundation
import UIKit

extension CALayer {
    
    static func generateCellSubtractLayer(bg: CGRect, round: CGRect) -> CALayer {
        let layer = CAShapeLayer()
        let bgPath = UIBezierPath(rect: bg)
        let roundPath = UIBezierPath(roundedRect: round, cornerRadius: 10)
        
        bgPath.append(roundPath.reversing())
        bgPath.usesEvenOddFillRule = true
        bgPath.addClip()
        
        layer.path = bgPath.cgPath
        layer.fillColor = UIColor.white.cgColor
        layer.position = CGPoint(x: 0, y: 0)
                
        return layer
    }
    
    static func generateCellCoverLayer(bg: CGRect, round: CGRect) -> CALayer {
        
        let bgPath = UIBezierPath(rect: bg)
        let bgLayer = CAShapeLayer()
        bgLayer.path = bgPath.cgPath
        bgLayer.fillColor = UIColor.white.cgColor
//        bgLayer.position = CGPoint(x: 0, y: 0)

        
        let roundPath = UIBezierPath(roundedRect: round, cornerRadius: 10)
        let roundLayer = CAShapeLayer()
        roundLayer.path = roundPath.cgPath
        roundLayer.fillColor = UIColor(white: 0.95, alpha: 1).cgColor
        
        bgLayer.addSublayer(roundLayer)
        return bgLayer
    }
    
}
