//
//  TeamTableViewCell.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class TeamTableViewCell: UITableViewCell {
    
    private let membersLabel = MembersLabel()
    private let containerView = UIView()
    
    func configure(team: Team) {
        containerView.backgroundColor = team.color
        membersLabel.fillWithPlayers(team.players)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        containerView.layer.cornerRadius = 10
        
        membersLabel.font = .membersLarge
        
        contentView.addSubview(containerView)
        containerView.addSubview(membersLabel)
        
        containerView.snp.makeConstraints { (make) in
            make.center.width.equalToSuperview()
            make.top.bottom.equalToSuperview().inset(10)
        }
        
        membersLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.top.equalToSuperview().inset(10)
            make.width.equalToSuperview().multipliedBy(0.95)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
