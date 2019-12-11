//
//  QuestionSetPickingViewController.swift
//  Teamboozing
//
//  Created by Patrik Hora on 11/12/2019.
//  Copyright © 2019 Manicek. All rights reserved.
//

import UIKit

class QuestionSetPickingViewController: UIViewController {
    
    private let tableView = UITableView()

    private let tableViewManager = QuestionSetTableViewManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewManager.delegate = self
        tableViewManager.tableView = tableView
        tableViewManager.questionSets = QuestionSet.allQuestionSets
        
        setupUI()
        addSubviewsAndSetupConstraints()
    }
}

extension QuestionSetPickingViewController: QuestionSetTableViewManagerDelegate {
    func questionSetSelected(_ set: QuestionSet) {
         Game.start(questions: set.questions)
    }
}

private extension QuestionSetPickingViewController {
    
    func setupUI() {
        view.backgroundColor = .background
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            tableView
            ])
    
        tableView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.top.equalToSuperview().offset(50)
            make.bottom.equalToSuperview().offset(-10)
        }

    }
}
