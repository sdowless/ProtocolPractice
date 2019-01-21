//
//  ViewController.swift
//  ProtocolTutorial
//
//  Created by Stephen Dowless on 1/20/19.
//  Copyright © 2019 Stephan Dowless. All rights reserved.
//

import UIKit

private let reuseIdentifier = "UserCell"

class ViewController: UITableViewController {
    
    // MARK: - Properties
    
    var users = [User]()
    
    // MARK: - Init

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UserCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 88
        tableView.tableFooterView = UIView()
        
        configureUsers()
    }
    
    // MARK: - Helper Functions
    
    func configureUsers() {
        let user1 = User(username: "Batman", fullname: "Bruce Wayne", profileImage: #imageLiteral(resourceName: "batman"), isFollowed: false)
        let user2 = User(username: "Joker", fullname: "Heath Ledger", profileImage: #imageLiteral(resourceName: "8ba958a62401f629fe0b8973ea750809"), isFollowed: false)
        let user3 = User(username: "Superman", fullname: "Clark Kent", profileImage: #imageLiteral(resourceName: "superman"), isFollowed: false)
        let user4 = User(username: "Venom", fullname: "Eddie Brock", profileImage: #imageLiteral(resourceName: "venom"), isFollowed: false)
        let user6 = User(username: "Spiderman", fullname: "Peter Parker", profileImage: #imageLiteral(resourceName: "spiderman"), isFollowed: false)
        let user5 = User(username: "Ironman", fullname: "Tony Stark", profileImage: #imageLiteral(resourceName: "ironman"), isFollowed: false)
        
        users.append(user1)
        users.append(user2)
        users.append(user3)
        users.append(user4)
        users.append(user5)
        users.append(user6)
        
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension ViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! UserCell
        cell.delegate = self
        cell.user = users[indexPath.row]
        return cell
    }
}

extension ViewController: UserCellDelegate {
    func onFollowTap(cell: UserCell) {
        
        guard let user = cell.user else { return }
        
        if user.isFollowed {
            // unfollow
            cell.followButton.configure(didFollow: false)
        } else {
            // follow
            cell.followButton.configure(didFollow: true)
        }
        
        cell.user?.isFollowed = !user.isFollowed
        
    }

}

