//
//  ViewController.swift
//  WPFacebookTableView
//
//  Created by Alex on 12/12/20.
//

import UIKit

class ViewController: UIViewController {
        
    var dataSources: [CellItem] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.dataSources = CellItem.mockTestItems()
                
        self.tableView.separatorStyle = .none
        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        self.tableView.backgroundColor = .clear
        let size = UIScreen.main.bounds.size
        
        let hf = CGRect(x: 0, y: -1 * size.height, width: size.width, height: size.height)
        let header = UIView(frame: hf)
        header.backgroundColor = .white
        
        let ff = CGRect(x: 0, y: self.tableView.bounds.height, width: size.width, height: size.height)
        let footer = UIView(frame: ff)
        footer.backgroundColor = .white
        footer.tag = 1001
        
        self.tableView.addSubview(header)
        self.tableView.addSubview(footer)
        
        
        self.tableView.addObserver(self, forKeyPath: "contentOffset", options: [.new], context: nil)
        self.tableView.gradientlayer(with: .purple, bottom: .blue, superView: self.tableView!.superview ?? UIView())
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "contentOffset" {
            if let footer = self.tableView.viewWithTag(1001) {
                let y = self.tableView.contentSize.height
                let size = footer.bounds.size
                footer.frame = CGRect(origin: CGPoint(x: 0, y: y), size: size)
            }
        }
    }
    

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSources.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as! TableViewCell
        cell.selectionStyle = .none
        let item = self.dataSources[indexPath.row]
        cell.updateCellItem(item: item)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.dataSources[indexPath.row].height
    }
}

