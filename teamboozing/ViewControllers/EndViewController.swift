//
//  EndViewController.swift
//  teamboozing
//
//  Created by Patrik Hora on 20/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class EndViewController: UIViewController {

    private let stackView = UIStackView()
    private let completedButton = CompletedButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    @objc func completedButtonTapped() {
        Game.restart()
    }

}

private extension EndViewController {
    func setupUI() {
        view.backgroundColor = .background
        
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        
        for team in Game.teams {
            let teamResultView = TeamResultView(team: team)
            stackView.addArrangedSubview(teamResultView)
            teamResultView.snp.makeConstraints { (make) in
                make.height.equalTo(80)
                make.width.equalToSuperview()
            }
        }
        
        completedButton.addTarget(self, action: #selector(completedButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            stackView,
            completedButton
            ])

        stackView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(Game.teams.count * 100)
        }
        
        completedButton.snp.makeConstraints { (make) in
            make.top.equalTo(stackView.snp.bottom).offset(20)
            make.width.height.equalTo(70)
            make.centerX.equalToSuperview()
        }
    }
}


class TeamResultView: UIView {
    
    private let imageView = UIImageView()
    private let drinkCountLabel = UILabel()
    
    init(team: Team) {
        super.init(frame: .zero)
        
        imageView.image = #imageLiteral(resourceName: "beer")
        
        backgroundColor = team.color
        layer.cornerRadius = 10
        
        drinkCountLabel.font = .drinkCount
        drinkCountLabel.text = "\(team.drinks) X"
        
        addSubviews([
            imageView,
            drinkCountLabel
            ])
        
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.snp.centerX).offset(20)
            make.height.width.equalTo(60)
        }
        
        drinkCountLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(imageView.snp.left).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
