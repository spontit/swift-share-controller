//
//  CancelCell.swift
//  ShareUI
//
//  Created by Zhang Qiuhao on 6/5/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import Foundation
import UIKit

class CancelCell : UITableViewCell {
    
    static let CELL_HEIGHT : CGFloat = 80
    
    // MARK: -Internal Globals
    
    let cancelLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "Cancel"
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
    }()
    
    // MARK: -Overriden Funtions
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.contentView.addSubview(self.cancelLabel)
        self.giveBorder(color: .black)
        self.cancelLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.cancelLabel.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
    }
}
