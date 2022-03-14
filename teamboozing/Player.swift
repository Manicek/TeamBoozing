//
//  Player.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import Foundation


class Player {
    
    static let unknown = Player(name: "Neznámý hráč")
    
    let name: String
    
    init(name: String) {
        self.name = name
    }
}
