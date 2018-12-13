//
//  Team.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
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
        return toPickPlayers.popLast()!
    }
    
    init(color: UIColor) {
        self.color = color
    }
    
    func addPlayer(_ player: Player) {
        players.append(player)
    }
}
