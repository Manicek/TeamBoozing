//
//  DrinkViewController.swift
//  teamboozing
//
//  Created by Patrik Hora on 20/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class DrinkViewController: UIViewController {
    
    private let membersLabel = MembersLabel()
    private let quitButton = QuitButton()
    private let continueButton = ContinueButton()
    private let imageView = UIImageView()
    private let drinkCountLabel = UILabel()
    
    private var drinkCount = 0
    
    init(team: Team, difficulty: Int) {
        super.init(nibName: nil, bundle: nil)
        
        drinkCount = (team.players.count * difficulty) + Int.randomBetween(1, 7)
        team.drinks += drinkCount
        membersLabel.fillWithPlayers(team.players)
        view.backgroundColor = team.color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    @objc func quitButtonTapped() {
        Game.showEndAlert(from: self)
    }
    
    @objc func continueButtonTapped() {
        Game.showNextQuestion()
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

private extension DrinkViewController {
    
    func setupUI() {
        imageView.image = #imageLiteral(resourceName: "beer")
        
        drinkCountLabel.font = .drinkCount
        drinkCountLabel.text = "\(drinkCount) x"
        
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
                
        quitButton.addTarget(self, action: #selector(quitButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            membersLabel,
            quitButton,
            imageView,
            drinkCountLabel,
            continueButton
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
        
        imageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalTo(view.snp.centerX).offset(10)
            make.size.equalTo(DrinkButton.size)
            
        }
        
        drinkCountLabel.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.right.equalTo(imageView.snp.left).offset(-10)
        }
        
        continueButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
