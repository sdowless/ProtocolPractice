//
//  UserCell.swift
//  ProtocolTutorial
//
//  Created by Stephen Dowless on 1/20/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

protocol UserCellDelegate {
    func onFollowTap(cell: UserCell)
}

class UserCell: UITableViewCell {
    
    // MARK: - Properties
    
    var delegate: UserCellDelegate?
    
    var user: User? {
        didSet {
            profileImageView.image = user?.profileImage
            usernameLabel.text = user?.username
            fullnameLabel.text = user?.fullname
        }
    }
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.text = "Username"
        return label
    }()
    
    let fullnameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        label.text = "Username"
        return label
    }()
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }()
    
    lazy var followButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.backgroundColor = UIColor(red: 17/255, green: 154/255, blue: 237/255, alpha: 1)
        button.addTarget(self, action: #selector(handleFollowTapped), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        
        addSubview(profileImageView)
        let dimension: CGFloat = 60
        profileImageView.centerOnYAxis(inView: self, constant: 0)
        profileImageView.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: dimension, height: dimension)
        profileImageView.layer.cornerRadius = dimension / 2
        
        addSubview(usernameLabel)
        usernameLabel.anchor(top: nil, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        usernameLabel.centerOnYAxis(inView: self, constant: -12)
        
        addSubview(fullnameLabel)
        fullnameLabel.anchor(top: nil, left: profileImageView.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
        fullnameLabel.centerOnYAxis(inView: self, constant: 12)
        
        addSubview(followButton)
        followButton.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 108, height: 32)
        followButton.centerOnYAxis(inView: self, constant: 0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func handleFollowTapped() {
        delegate?.onFollowTap(cell: self)
    }
    
}
