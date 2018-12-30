//
//  TeamsRosterTableViewManager.swift
//  teamboozing
//
//  Created by Patrik Hora on 30/12/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class TeamsRosterTableViewManager: NSObject {
    var teams = [Team]() {
        didSet {
            reload()
        }
    }
    
    weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.backgroundColor = .clear
            tableView.estimatedRowHeight = 56
            
            tableView.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellIdentifier)
        }
    }
    
    func reload() {
        tableView.reloadData()
    }
}

extension TeamsRosterTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
}

extension TeamsRosterTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellIdentifier, for: indexPath) as! TeamTableViewCell
        cell.configure(team: teams[indexPath.row])
        return cell
    }
}
