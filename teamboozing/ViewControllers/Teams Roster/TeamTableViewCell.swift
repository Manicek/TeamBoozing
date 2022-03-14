//
//  TeamTableViewCell.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


class TeamTableViewCell: UITableViewCell {
    
    private let membersLabel = MembersLabel()
    private let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        containerView.layer.cornerRadius = 10
        
        membersLabel.font = .membersLarge
        
        contentView.addSubview(containerView)
        containerView.addSubview(membersLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.center.width.equalToSuperview()
        }
        
        membersLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Internal extension

extension TeamTableViewCell {
    
    func configure(team: Team) {
        containerView.backgroundColor = team.color
        membersLabel.fillWithPlayers(team.players)
    }
}
