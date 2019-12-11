//
//  TeamsRosterViewController.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class TeamsRosterViewController: UIViewController {
    
    private let judgeLabel = UILabel()
    private let continueButton = ContinueButton()
    private let tableView = UITableView()

    private let tableViewManager = TeamsRosterTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewManager.tableView = tableView
        tableViewManager.teams = Game.teams
        
        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    @objc func continueButtonTapped() {
        Game.start(questions: Question.allQuestions)
    }
}

private extension TeamsRosterViewController {
    
    func setupUI() {
        view.backgroundColor = .background
        
        judgeLabel.font = .judge
        judgeLabel.textAlignment = .center
        if let judge = Game.teams.last?.players.first {
            judgeLabel.text = "Rozhodčí: \(judge.name)"
        }
        
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            judgeLabel,
            tableView,
            continueButton
            ])
        
        judgeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().inset(10)
            make.top.equalToSuperview().offset(50)
        }
    
        tableView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalTo(judgeLabel.snp.bottom).offset(10)
            make.bottom.equalTo(continueButton.snp.top).offset(-10)
        }
        
        continueButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
