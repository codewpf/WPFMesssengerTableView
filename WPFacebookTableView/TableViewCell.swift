//
//  TableViewCell.swift
//  WPFacebookTableView
//
//  Created by Alex on 12/12/20.
//

import UIKit

class TableViewCell: UITableViewCell, ReusableIdentifier {
    
    private var txt: UILabel = {
        let la = UILabel()
        la.numberOfLines = 0
        la.font = .systemFont(ofSize: 17)
        return la
    }()
    private var item: CellItem?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TableViewCell {
    private func initUI() {
        self.backgroundColor = .clear
        self.contentView.addSubview(self.txt)
    }
    
    func updateCellItem(item: CellItem) {
        let sublayers = self.contentView.layer.sublayers ?? []
        if let old = self.item?.layer, sublayers.contains(old) {
            self.contentView.layer.replaceSublayer(old, with: item.layer)
        } else {
            self.contentView.layer.insertSublayer(item.layer, at: 0)
        }
        self.item = item
        self.txt.text = item.text
        
        self.txt.frame = item.txtFrame
        self.txt.textColor = item.txtColor
    }
}



protocol ReusableIdentifier {}
extension ReusableIdentifier {
    static var identifier: String {
        get {  return "\(Self.self)_identifier" }
    }
}
