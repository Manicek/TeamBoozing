//
//  QuestionSetPickingViewController.swift
//
//  Created by Patrik Hora on 11/12/2019.
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


// MARK: - QuestionSetTableViewManagerDelegate

extension QuestionSetPickingViewController: QuestionSetTableViewManagerDelegate {
    
    func questionSetSelected(_ set: QuestionSet) {
         Game.start(questions: set.questions)
    }
}


// MARK: - Private extension

private extension QuestionSetPickingViewController {
    
    func setupUI() {
        view.backgroundColor = .background
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubview(tableView)
    
        tableView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(50)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.8)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
