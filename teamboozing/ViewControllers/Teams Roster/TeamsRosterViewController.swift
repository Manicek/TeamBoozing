//
//  TeamsRosterViewController.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


class TeamsRosterViewController: UIViewController {
    
    private let judgeLabel = UILabel()
    private let continueButton = ContinueButton()
    private let tableView = UITableView()

    private let tableViewManager = TeamsRosterTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        tableViewManager.tableView = tableView
        tableViewManager.teams = Game.teams
        
        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    @objc func continueButtonTapped() {
        navigationController?.pushViewController(QuestionSetPickingViewController(), animated: true)
    }
}


// MARK: - Private extension

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
        view.addSubviews(
            [
                judgeLabel,
                tableView,
                continueButton
            ]
        )
        
        judgeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.left.right.equalToSuperview().inset(10)
        }
    
        tableView.snp.makeConstraints { make in
            make.top.equalTo(judgeLabel.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
        }
        
        continueButton.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom).offset(10)
            make.height.equalTo(ContinueButton.height)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
