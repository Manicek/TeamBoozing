//
//  TeamView.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class TeamView: UIView {
    
    private let membersLabel = MembersLabel()
    
    init(team: Team) {
        super.init(frame: .zero)
        
        layer.cornerRadius = 10
        
        backgroundColor = team.color
        membersLabel.fillWithPlayers(team.players)
        membersLabel.font = .membersLarge
        
        addSubview(membersLabel)
        membersLabel.snp.makeConstraints { (make) in
            make.centerX.bottom.top.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
