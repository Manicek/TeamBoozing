//
//  QuestionSetTableViewManager.swift
//  Teamboozing
//
//  Created by Patrik Hora on 11/12/2019.
//  Copyright © 2019 Manicek. All rights reserved.
//

import UIKit

protocol QuestionSetTableViewManagerDelegate: class {
    func questionSetSelected(_ set: QuestionSet)
}


class QuestionSetTableViewManager: NSObject {
    var questionSets = [QuestionSet]() {
        didSet {
            reload()
        }
    }
    
    weak var delegate: QuestionSetTableViewManagerDelegate?
    weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
            tableView.separatorStyle = .none
            tableView.backgroundColor = .clear
            tableView.estimatedRowHeight = 56
            
            tableView.register(QuestionSetTableViewCell.self, forCellReuseIdentifier: QuestionSetTableViewCell.cellIdentifier)
        }
    }
    
    func reload() {
        tableView.reloadData()
    }
}

extension QuestionSetTableViewManager: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.questionSetSelected(questionSets[indexPath.row])
    }
}

extension QuestionSetTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questionSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuestionSetTableViewCell.cellIdentifier, for: indexPath) as! QuestionSetTableViewCell
        cell.configure(questionSetName: questionSets[indexPath.row].name)
        return cell
    }
}

