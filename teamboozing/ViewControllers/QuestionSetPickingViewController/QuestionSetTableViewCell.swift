//
//  QuestionSetTableViewCell.swift
//
//  Created by Patrik Hora on 11/12/2019.
//

import UIKit


class QuestionSetTableViewCell: UITableViewCell {
    
    private let questionSetNameLabel = UILabel()
    private let containerView = UIView()
    
    func configure(questionSetName: String) {
        containerView.backgroundColor = .white
        questionSetNameLabel.text = questionSetName
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        selectionStyle = .none
        
        containerView.layer.cornerRadius = 10
        
        questionSetNameLabel.font = .questionSet
        
        contentView.addSubview(containerView)
        containerView.addSubview(questionSetNameLabel)
        
        containerView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.center.width.equalToSuperview()
        }
        
        questionSetNameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.95)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
