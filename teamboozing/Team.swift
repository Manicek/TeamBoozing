//
//  Team.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


class Team: NSObject {
    
    let color: UIColor
    var players = [Player]()
    var drinks = 0
    
    private var toPickPlayers = [Player]()
    
    var randomPlayer: Player {
        if toPickPlayers.isEmpty {
            toPickPlayers.append(contentsOf: players)
            toPickPlayers = toPickPlayers.shuffled()
        }
        return toPickPlayers.popLast() ?? Player.unknown
    }
    
    init(color: UIColor) {
        self.color = color
    }
    
    func addPlayer(_ player: Player) {
        players.append(player)
    }
}
