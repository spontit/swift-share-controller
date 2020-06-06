//
//  ViewController.swift
//  ShareUI
//
//  Created by Zhang Qiuhao on 6/5/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    static let TABLE_PADDING : CGFloat = 5
    
    // MARK: -Internal Globals
    private lazy var shareButton : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Share", for: .normal)
        btn.setTitleColor(.black, for: .normal)
        return btn
    }()
    
    private var shareTable: ShareTableView!
    private var isShowingShareTable : Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
    }
    
    
    
    private func setUp() {
        self.shareTable = ShareTableView(frame: .zero)
        self.shareTable.delegate = self
        self.shareTable.dataSource = self
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.shareButton)
        self.shareButton.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.shareButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.shareButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.shareButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        
        self.view.addSubview(self.shareTable)
        self.shareTable.topAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.shareTable.heightAnchor.constraint(equalToConstant: CGFloat(InviteOptions.allCases.count) * ShareTableCell.CELL_HEIGHT + CancelCell.CELL_HEIGHT).isActive = true
        self.shareTable.widthAnchor.constraint(equalToConstant: self.view.frame.width - ViewController.TABLE_PADDING).isActive = true
        self.shareTable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.shareButton.addTarget(self, action: #selector(self.sharePressed(_:)), for: .touchUpInside)
        
    }
    
    private func hideShareTable() {
        UIView.animate(withDuration: 1.0, animations: {
            self.shareTable.frame.origin.y += (CGFloat(InviteOptions.allCases.count) * ShareTableCell.CELL_HEIGHT + CancelCell.CELL_HEIGHT + ViewController.TABLE_PADDING)
        })
        self.isShowingShareTable = false
    }
    
    @objc private func sharePressed(_ sender: UIButton) {
        if self.isShowingShareTable == false {
            UIView.animate(withDuration: 1.0, animations: {
                self.shareTable.frame.origin.y -= (CGFloat(InviteOptions.allCases.count) * ShareTableCell.CELL_HEIGHT + CancelCell.CELL_HEIGHT)
            })
            self.isShowingShareTable = true
        } else {
            self.hideShareTable()
        }
    }
    
    @objc private func cancel() {
        self.dismiss(animated: true) {}
    }
    


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InviteOptions.allCases.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == InviteOptions.allCases.count {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CancelCell", for: indexPath) as! CancelCell
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! ShareTableCell
        cell.option = InviteOptions(rawValue: indexPath.row)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == InviteOptions.allCases.count {
            return CancelCell.CELL_HEIGHT
        } else {
            return ShareTableCell.CELL_HEIGHT
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == InviteOptions.allCases.count {
            self.hideShareTable()
        } else {
            let vcToPresent = UIViewController()
            vcToPresent.view.backgroundColor = .white
            let navVC = UINavigationController(rootViewController: vcToPresent)
            navVC.modalPresentationStyle = .fullScreen
            vcToPresent.navigationItem.leftBarButtonItems = [UIBarButtonItem.getCancelButton(target: self, selector: #selector(self.cancel))]
            switch InviteOptions(rawValue: indexPath.row)! {
            case .addFollowers:
                vcToPresent.title = "Add Followers"
                self.present(navVC, animated: true)
            case .inviteContacts:
                vcToPresent.title = "Invite Contacts"
                self.present(navVC, animated: true)
            case .shareLink:
                let link = NSURL(string: "google.com")
                let objectsToShare : [Any] = [link]
                let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                activityVC.popoverPresentationController?.sourceView = self.view
                self.present(activityVC, animated: true, completion: nil)
            case .showHowToJoinViaText:
                vcToPresent.title = "Join via Text"
                self.present(navVC, animated: true)
            case .shareCode:
                vcToPresent.title = "Share Code"
                self.present(navVC, animated: true)
            }
            self.hideShareTable()
        }

    }
    
}

