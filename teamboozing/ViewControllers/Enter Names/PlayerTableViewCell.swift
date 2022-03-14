//
//  PlayerTableViewCell.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


// MARK: - PlayerTableViewCellDelegate

protocol PlayerTableViewCellDelegate: AnyObject {
    
    func deletePlayer(_ player: Player)
}


// MARK: - PlayerTableViewCell

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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        backgroundColor = .clear
        
        selectionStyle = .none
        
        playerNameLabel.textAlignment = .center
        playerNameLabel.font = .playerCell
        
        deleteButton.setImage(UIImage.delete, for: .normal)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        contentView.addSubviews(
            [
                playerNameLabel,
                deleteButton
            ]
        )
        
        playerNameLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.right.equalTo(deleteButton.snp.left)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.right.centerY.equalToSuperview()
            make.size.equalTo(32)
        }
    }
    
    @objc func deleteButtonTapped() {
        guard let player = player else { return }
        delegate?.deletePlayer(player)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
