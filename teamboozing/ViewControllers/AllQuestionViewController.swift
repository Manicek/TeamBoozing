//
//  AllQuestionViewController.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class AllQuestionViewController: UIViewController {
    
    private let quitButton = QuitButton()
    private let questionLabel = QuestionLabel()
    private let drinkStackView = UIStackView()
    
    private let question: Question

    init(question: Question) {
        self.question = question
        super.init(nibName: nil, bundle: nil)
        
        questionLabel.text = question.text()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    @objc func quitButtonTapped() {
        Game.showEndAlert(from: self)
    }
    
    @objc func drinkButtonTapped(_ sender: DrinkButton) {
        Game.showDrinkScreen(for: sender.team!, difficulty: question.difficulty)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension AllQuestionViewController {
    
    func setupUI() {
        view.backgroundColor = .background
        
        for team in Game.teams {
            let drinkButton = DrinkButton(team: team)
            drinkButton.addTarget(self, action: #selector(drinkButtonTapped(_:)), for: .touchUpInside)
            drinkButton.snp.makeConstraints { (make) in
                make.width.height.equalTo(70)
            }
            drinkStackView.addArrangedSubview(drinkButton)
        }
        
        drinkStackView.distribution = .equalSpacing
        drinkStackView.alignment = .center
        
        quitButton.addTarget(self, action: #selector(quitButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            quitButton,
            questionLabel,
            drinkStackView
            ])
        
        quitButton.snp.makeConstraints { (make) in
            make.top.equalTo(topLayoutGuide.snp.bottom)
            make.right.equalToSuperview().inset(20)
            make.height.width.equalTo(50)
        }
        
        questionLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerY.equalToSuperview()
        }

        drinkStackView.snp.makeConstraints { (make) in
            make.centerX.equalTo(questionLabel)
            make.width.equalTo(Game.teams.count * 80)
            make.height.equalTo(70)
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
