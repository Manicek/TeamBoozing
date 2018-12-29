//
//  TeamQuestionViewController.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class TeamQuestionViewController: UIViewController {
    
    private let membersLabel = MembersLabel()
    private let quitButton = QuitButton()
    private let questionLabel = QuestionLabel()
    private let drinkButton = DrinkButton()
    private let completedButton = CompletedButton()
    private let team: Team
    private let difficulty: Int

    init(team: Team, questionText: NSMutableAttributedString, difficulty: Int) {
        self.team = team
        self.difficulty = difficulty
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = team.color
        membersLabel.fillWithPlayers(team.players)
        questionLabel.attributedText = questionText
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    @objc func drinkButtonTapped() {
        Game.showDrinkScreen(for: team, difficulty: difficulty)
    }
    
    @objc func completedButtonTapped() {
        Game.showNextQuestion()
    }
    
    @objc func quitButtonTapped() {
        Game.showEndAlert(from: self)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension TeamQuestionViewController {
    
    func setupUI() {
        view.backgroundColor = .background
        
        completedButton.addTarget(self, action: #selector(completedButtonTapped), for: .touchUpInside)
        
        drinkButton.addTarget(self, action: #selector(drinkButtonTapped), for: .touchUpInside)
        
        quitButton.addTarget(self, action: #selector(quitButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            membersLabel,
            quitButton,
            questionLabel,
            drinkButton,
            completedButton
            ])
        
        quitButton.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.right.equalToSuperview().inset(20)
        }
        
        membersLabel.snp.makeConstraints { (make) in
            make.top.equalTo(quitButton.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        questionLabel.snp.makeConstraints { (make) in
            make.centerX.width.equalTo(membersLabel)
            make.centerY.equalToSuperview()
        }
        
        drinkButton.snp.makeConstraints { (make) in
            make.right.equalTo(view.snp.centerX).offset(-30)
            make.bottom.equalToSuperview().inset(40)
        }
        
        completedButton.snp.makeConstraints { (make) in
            make.left.equalTo(view.snp.centerX).offset(30)
            make.bottom.height.width.equalTo(drinkButton)
        }
    }
}
