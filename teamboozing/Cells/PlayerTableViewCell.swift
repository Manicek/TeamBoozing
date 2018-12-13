//
//  PlayerTableViewCell.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

protocol PlayerTableViewCellDelegate: class {
    func deletePlayer(_ player: Player)
}

class PlayerTableViewCell: UITableViewCell {
    
    weak var delegate: PlayerTableViewCellDelegate?
   
    private let playerNameLabel = UILabel()
    private let deleteButton = UIButton()
    private var player: Player?
    
    func configure(_ delegate: PlayerTableViewCellDelegate, player: Player) {
        self.delegate = delegate
        self.player = player
        
        playerNameLabel.text = player.name
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        backgroundColor = .clear
        
        selectionStyle = .none
        
        playerNameLabel.textAlignment = .center
        playerNameLabel.font = UIFont.systemFont(ofSize: 24)
        
        deleteButton.setImage(#imageLiteral(resourceName: "delete"), for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        contentView.addSubviews([
            playerNameLabel,
            deleteButton
            ])
        
        playerNameLabel.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.right.equalTo(deleteButton.snp.left)
        }
        
        deleteButton.snp.makeConstraints { (make) in
            make.right.centerY.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.75)
            make.width.equalTo(deleteButton.snp.height)
        }
    }
    
    @objc func deleteButtonTapped() {
        guard let player = player else { return }
        delegate?.deletePlayer(player)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
