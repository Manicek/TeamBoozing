//
//  TeamRostersViewController.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class TeamRostersViewController: UIViewController {
    
    private let stackView = UIStackView()
    private let continueButton = ContinueButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    @objc func continueButtonTapped() {
        Game.start()
    }
}

private extension TeamRostersViewController {
    
    func setupUI() {
        view.backgroundColor = .background
        
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .vertical

        for team in Game.teams {
            let teamView = TeamView(team: team)
            stackView.addArrangedSubview(teamView)
            teamView.snp.makeConstraints { (make) in
                make.width.equalToSuperview()
                make.height.equalTo(135)
            }
        }
        
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            stackView,
            continueButton
            ])
    
        stackView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.height.equalTo(Game.teams.count * 140)
        }
        
        continueButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
