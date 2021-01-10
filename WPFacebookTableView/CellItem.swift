//
//  CellItem.swift
//  WPFacebookTableView
//
//  Created by Alex on 13/12/20.
//

import Foundation
import UIKit

class CellItem {
    static var topGap: CGFloat = 20
    static var leftGap: CGFloat = 30

    var isMe: Bool = false
    var text: String = ""
    var bubble: CGRect = CGRect.zero
    var txtFrame: CGRect = CGRect.zero
    var txtColor: UIColor = .white
    var height: CGFloat = 0
    var layer: CALayer = CALayer()
}



extension CellItem {
    static func mockTestItems() -> [CellItem] {
        var items: [CellItem] = []
        let width = UIScreen.main.bounds.width

        for _ in 0 ..< 19 {
            
            let isMe = Int.random(in: 0 ..< 100) % 3 < 2
            let text = String.random
            let bound = CGSize(width: width * 2 / 3, height: CGFloat(MAXFLOAT))
            let size = text.strSize(with: bound, font: .systemFont(ofSize: 17), miniHeight: true)
            let height = size.height + 2 * CellItem.topGap
            let item = CellItem()
            item.isMe = isMe
            item.text = text
            item.height = height
                        
            let bgFrame = CGRect(x: 0, y: 0, width: width, height: height)
            if isMe == true {
                let x: CGFloat = width - CellItem.leftGap - size.width
                item.txtFrame = CGRect(origin: CGPoint(x: x, y: CellItem.topGap), size: size)
                item.bubble = CGRect(origin: CGPoint(x: x-10, y: CellItem.topGap-10), size: CGSize(width: size.width+20, height: size.height+20))
                let layer = CALayer.generateCellSubtractLayer(bg: bgFrame, round: item.bubble)
                item.layer = layer
                item.txtColor = .white
            } else {
                let x: CGFloat = CellItem.leftGap
                item.txtFrame = CGRect(origin: CGPoint(x: x, y: CellItem.topGap), size: size)
                item.bubble = CGRect(origin: CGPoint(x: x-10, y: CellItem.topGap-10), size: CGSize(width: size.width+20, height: size.height+20))
                let layer = CALayer.generateCellCoverLayer(bg: bgFrame, round: item.bubble)
                item.layer = layer
                item.txtColor = .black
            }
            
            items.append(item)
        }
        return items
    }
}
