//
//  TeamsRosterTableViewManager.swift
//
//  Created by Patrik Hora on 30/12/2018.
//

import UIKit


class TeamsRosterTableViewManager: NSObject {
    
    var teams = [Team]() {
        didSet {
            reload()
        }
    }
    
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
            tableView?.delegate = self
            tableView?.separatorStyle = .none
            tableView?.backgroundColor = .clear
            tableView?.estimatedRowHeight = 56
            
            tableView?.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellIdentifier)
        }
    }
    
    func reload() {
        tableView?.reloadData()
    }
}


 // MARK: - UITableViewDataSource

extension TeamsRosterTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: TeamTableViewCell.cellIdentifier, for: indexPath
        ) as? TeamTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(team: teams[indexPath.row])
        return cell
    }
}


// MARK: - UITableViewDelegate

extension TeamsRosterTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) { }
}
