//
//  EnterNamesTableViewManager.swift
//  teamboozing
//
//  Created by Patrik Hora on 29/12/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

protocol EnterNamesTableViewManagerDelegate: class {
    func playerCountChanged(_ count: Int)
    func showUsedNameAlert()
}

class EnterNamesTableViewManager: NSObject {
    
    var players = [Player]() {
        didSet {
            delegate?.playerCountChanged(players.count)
            reload()
        }
    }
    
    weak var delegate: EnterNamesTableViewManagerDelegate?
    weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.backgroundColor = .clear
            tableView.estimatedRowHeight = 56
            
            tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.cellIdentifier)
        }
    }
    
    func reload() {
        tableView.reloadData()
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
        tableView.reloadData()
    }
}


extension EnterNamesTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.cellIdentifier, for: indexPath) as! PlayerTableViewCell
        cell.configure(self, player: players[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
}

extension EnterNamesTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension EnterNamesTableViewManager: PlayerTableViewCellDelegate {
    
    func deletePlayer(_ player: Player) {
        var indexToDelete = -1
        for index in 0..<players.count {
            if players[index].name == player.name {
                indexToDelete = index
                break
            }
        }
        if indexToDelete > -1 {
            players.remove(at: indexToDelete)
        }
        delegate?.playerCountChanged(players.count)
        tableView.reloadData()
    }
}
