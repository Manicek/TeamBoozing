//
//  MembersLabel.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


class MembersLabel: UILabel {

    init() {
        super.init(frame: .zero)
        
        makeMultiline()
        textAlignment = .center
        font = .membersSmall
    }
    
    func fillWithPlayers(_ players: [Player]) {
        let names = players.map { $0.name }
        text = names.joined(separator: ", ")
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
