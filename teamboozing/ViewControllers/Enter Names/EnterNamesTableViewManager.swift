//
//  EnterNamesTableViewManager.swift
//
//  Created by Patrik Hora on 29/12/2018.
//

import UIKit


// MARK: - EnterNamesTableViewManagerDelegate

protocol EnterNamesTableViewManagerDelegate: AnyObject {
    
    func playerCountChanged(_ count: Int)
    func showUsedNameAlert()
}


// MARK: - EnterNamesTableViewManager

class EnterNamesTableViewManager: NSObject {
    
    var players = [Player]() {
        didSet {
            delegate?.playerCountChanged(players.count)
            reload()
        }
    }
    
    weak var delegate: EnterNamesTableViewManagerDelegate?
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
            tableView?.delegate = self
            tableView?.separatorStyle = .none
            tableView?.backgroundColor = .clear
            tableView?.estimatedRowHeight = 56
            
            tableView?.register(
                PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.cellIdentifier
            )
        }
    }
    
    func reload() {
        tableView?.reloadData()
    }
    
    func addPlayer(name: String) {
        for player in players {
            if player.name == name {
                delegate?.showUsedNameAlert()
                return
            }
        }
        players.insert(Player(name: name), at: 0)
        delegate?.playerCountChanged(players.count)
        tableView?.reloadData()
    }
}


// MARK: - UITableViewDataSource

extension EnterNamesTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PlayerTableViewCell.cellIdentifier, for: indexPath
        ) as? PlayerTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(self, player: players[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        players.count
    }
}


// MARK: - UITableViewDelegate

extension EnterNamesTableViewManager: UITableViewDelegate {
    
}


// MARK: - PlayerTableViewCellDelegate

extension EnterNamesTableViewManager: PlayerTableViewCellDelegate {
    
    func deletePlayer(_ player: Player) {
        let indexToDelete = players.firstIndex { $0.name == player.name }
        if let indexToDelete = indexToDelete {
            players.remove(at: indexToDelete)
        }
        delegate?.playerCountChanged(players.count)
        tableView?.reloadData()
    }
}
