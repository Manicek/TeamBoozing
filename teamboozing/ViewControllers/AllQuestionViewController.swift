//
//  AllQuestionViewController.swift
//
//  Created by Patrik Hora on 17/08/2018.
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
        
        questionLabel.text = question.allText()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}


// MARK: - Actions

private extension AllQuestionViewController {
    
    @objc
    func quitButtonTapped() {
        Game.showEndAlert(from: self)
    }
    
    @objc
    func drinkButtonTapped(_ sender: DrinkButton) {
        if let team = sender.team {
            Game.showDrinkScreen(for: team, difficulty: question.difficulty)
        }
    }
}


// MARK: - Private extension

private extension AllQuestionViewController {
    
    func setupUI() {
        view.backgroundColor = .background
        
        for team in Game.teams {
            let drinkButton = DrinkButton(team: team)
            drinkButton.addTarget(self, action: #selector(drinkButtonTapped(_:)), for: .touchUpInside)
            drinkStackView.addArrangedSubview(drinkButton)
        }
        
        drinkStackView.distribution = .equalSpacing
        drinkStackView.alignment = .center
        
        quitButton.addTarget(self, action: #selector(quitButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews(
            [
                quitButton,
                questionLabel,
                drinkStackView
            ]
        )
        
        quitButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.equalToSuperview().inset(20)
        }
        
        questionLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.centerY.equalToSuperview()
        }

        drinkStackView.snp.makeConstraints { make in
            make.centerX.equalTo(questionLabel)
            make.width.equalTo(Game.teams.count * Int(DrinkButton.size) + (Game.teams.count - 1) * 10)
            make.height.equalTo(DrinkButton.size)
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
