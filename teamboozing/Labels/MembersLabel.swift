//
//  MembersLabel.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class MembersLabel: UILabel {

    init() {
        super.init(frame: .zero)
        
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 24)
    }
    
    func fillWithPlayers(_ players: [Player]) {
        if players.isEmpty { return }
        
        text = ""
        for player in players {
            text?.append("\(player.name), ")
        }
        
        text = String(text!.dropLast(2))
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
