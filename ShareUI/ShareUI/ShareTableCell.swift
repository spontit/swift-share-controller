//
//  ShareTableCell.swift
//  ShareUI
//
//  Created by Zhang Qiuhao on 6/5/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import UIKit

class ShareTableCell : UITableViewCell {
    
    static let CELL_HEIGHT : CGFloat = 60
    static let IMG_DIM : CGFloat = 50
    
    // MARK: -Globals
    var optionLabel : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        return lbl
    }()
    
    var optionImage : UIImageView = {
        let imgVW = UIImageView()
        imgVW.translatesAutoresizingMaskIntoConstraints = false
        imgVW.backgroundColor = .gray
        return imgVW
    }()
    
    var option: InviteOptions! {
        didSet {
            self.optionLabel.text = self.option.getText()
        }
    }
    
    // MARK: -Internal Globals
    
    private let imageEmbeddedView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let overallStack : UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 10
        stack.axis = .horizontal
        return stack
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.giveBorder(color: .black)
        
        self.imageEmbeddedView.addSubview(self.optionImage)
        self.imageEmbeddedView.heightAnchor.constraint(equalToConstant: ShareTableCell.IMG_DIM).isActive = true
        self.imageEmbeddedView.widthAnchor.constraint(equalToConstant: ShareTableCell.IMG_DIM).isActive = true
        
        self.optionImage.topAnchor.constraint(equalTo: self.imageEmbeddedView.topAnchor).isActive = true
        self.optionImage.bottomAnchor.constraint(equalTo: self.imageEmbeddedView.bottomAnchor).isActive = true
        self.optionImage.leadingAnchor.constraint(equalTo: self.imageEmbeddedView.leadingAnchor).isActive = true
        self.optionImage.trailingAnchor.constraint(equalTo: self.imageEmbeddedView.trailingAnchor).isActive = true
        
        self.overallStack.addArrangedSubview(self.imageEmbeddedView)
        self.overallStack.addArrangedSubview(self.optionLabel)
        
        
        self.contentView.addSubview(self.overallStack)
        self.imageEmbeddedView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.optionLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        self.overallStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5).isActive = true
        self.overallStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5).isActive = true
        self.overallStack.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.overallStack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
}
