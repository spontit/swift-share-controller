//
//  ShareTableView.swift
//  ShareUI
//
//  Created by Zhang Qiuhao on 6/5/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import UIKit

class ShareTableView : UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.setUp()
    }
    
    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.register(ShareTableCell.self, forCellReuseIdentifier: "cellId")
        self.register(CancelCell.self, forCellReuseIdentifier: "CancelCell")
        self.basicSetUp(rowHeight: nil, allowsSelection: true)
        
    }
    
}


