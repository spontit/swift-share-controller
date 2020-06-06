//
//  Extensions.swift
//  ShareUI
//
//  Created by Zhang Qiuhao on 6/5/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func basicSetUp(rowHeight : CGFloat?, allowsSelection: Bool) {
        if #available(iOS 11.0, *) {
            self.insetsContentViewsToSafeArea = true
            self.contentInsetAdjustmentBehavior = .scrollableAxes
        } else {
            // Fallback on earlier versions
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false
        self.separatorStyle = .none
        self.isEditing = false
        self.rowHeight = rowHeight ?? UITableView.automaticDimension
        self.estimatedRowHeight = self.rowHeight
        
        self.allowsSelection = allowsSelection
        self.allowsMultipleSelection = false
    }
}

extension UIView {
    
    func removeBorder() {
        self.layer.borderWidth = 0
    }
    
    func giveBorder(color: UIColor) {
        self.layer.borderWidth = 1
        self.layer.borderColor = color.cgColor
    }
    
    func giveBorder(color: UIColor, withWidth width: CGFloat) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
    
//    func giveShadow() {
//        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
//        self.layer.shadowOpacity = 1.0
//        self.layer.shadowRadius = self.layer.cornerRadius
//        self.layer.masksToBounds = false
//    }
    
    
}

extension UIBarButtonItem {
    static func getCancelButton(target: Any, selector: Selector) -> UIBarButtonItem {
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: target, action: selector)
        cancelBtn.tintColor = UIColor.blue
        return cancelBtn
    }
    
}

enum InviteOptions : Int, CaseIterable {
    case addFollowers
    case inviteContacts
    case shareLink
    case showHowToJoinViaText
    case shareCode
    
    func getText() -> String {
        switch self {
        case .addFollowers:
            return "Add Followers"
        case .inviteContacts:
            return "Invite Contacts"
        case .shareLink:
            return "Share a Link"
        case .showHowToJoinViaText:
            return "Show How to Join via Text"
        case .shareCode:
            return "Share a Code"
        }
    }
}
