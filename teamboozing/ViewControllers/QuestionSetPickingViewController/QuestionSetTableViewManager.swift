//
//  QuestionSetTableViewManager.swift
//
//  Created by Patrik Hora on 11/12/2019.
//

import UIKit


// MARK: - QuestionSetTableViewManagerDelegate

protocol QuestionSetTableViewManagerDelegate: AnyObject {
    
    func questionSetSelected(_ set: QuestionSet)
}


// MARK: - QuestionSetTableViewManager

class QuestionSetTableViewManager: NSObject {
    
    var questionSets = [QuestionSet]() {
        didSet {
            reload()
        }
    }
    
    weak var delegate: QuestionSetTableViewManagerDelegate?
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
            tableView?.delegate = self
            tableView?.separatorStyle = .none
            tableView?.backgroundColor = .clear
            tableView?.estimatedRowHeight = 56
            
            tableView?.register(
                QuestionSetTableViewCell.self, forCellReuseIdentifier: QuestionSetTableViewCell.cellIdentifier
            )
        }
    }
    
    func reload() {
        tableView?.reloadData()
    }
}


// MARK: - UITableViewDataSource

extension QuestionSetTableViewManager: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        questionSets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: QuestionSetTableViewCell.cellIdentifier, for: indexPath
        ) as? QuestionSetTableViewCell else {
            return UITableViewCell()
        }
        cell.configure(questionSetName: questionSets[indexPath.row].name)
        return cell
    }
}


// MARK: - UITableViewDelegate

extension QuestionSetTableViewManager: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.questionSetSelected(questionSets[indexPath.row])
    }
}
