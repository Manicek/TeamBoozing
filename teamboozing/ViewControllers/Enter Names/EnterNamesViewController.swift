//
//  ViewController.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit
import SnapKit

class EnterNamesViewController: UIViewController {
    
    private let minimumPlayerLabel = UILabel()
    private let startButton = StartButton()
    private let nameTextField = UITextField()
    private let tableView = UITableView()
    private let tableViewManager = EnterNamesTableViewManager()
    
    private let minimumPlayerCount = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewManager.delegate = self
        tableViewManager.tableView = tableView
        
        setupUI()
        addSubviewsAndSetupConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !Game.teams.isEmpty {
            showReusePlayersAlert()
        }
    }
    
    @objc func tapRecognized() {
        nameTextField.resignFirstResponder()
    }
    
    @objc func continueButtonTapped() {
        Game.createTeamsFromPlayers(tableViewManager.players)
        navigationController?.setViewControllers([TeamsRosterViewController()], animated: true)
    }
}

extension EnterNamesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addPlayer()
        nameTextField.text = ""
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        return text.count + string.count - range.length < 20
    }
}

extension EnterNamesViewController: EnterNamesTableViewManagerDelegate {
    func playerCountChanged(_ count: Int) {
        startButton.isHidden = count < 4
        minimumPlayerLabel.isHidden = !startButton.isHidden
    }
    
    func showUsedNameAlert() {
        showBasicAlert(message: "Jméno už je zabrané, vyber jiné", title: "Sorry!")
    }
}

private extension EnterNamesViewController {
    
    func addPlayer() {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        tableViewManager.addPlayer(name: name)
    }
    
    func showReusePlayersAlert() {
        let reusePlayersAlert = UIAlertController(title: "Znovu!", message: "Chcete předvyplnit jména hráčů z minule?", preferredStyle: UIAlertController.Style.alert)
        
        let reuseAction = UIAlertAction(title: "Ano", style: .default) { (_) -> Void in
            var previousPlayers = [Player]()
            for team in Game.teams {
                for player in team.players {
                    previousPlayers.append(player)
                }
            }
            self.tableViewManager.players = previousPlayers
        }
        let cancelAction = UIAlertAction(title: "Ne", style: .default)
        
        reusePlayersAlert.addAction(reuseAction)
        reusePlayersAlert.addAction(cancelAction)
        
        present(reusePlayersAlert, animated: true, completion: nil)
    }
    
    func setupUI() {
        view.backgroundColor = .background
        
        automaticallyAdjustsScrollViewInsets = false
        
        let recognizer = UITapGestureRecognizer()
        recognizer.cancelsTouchesInView = false
        recognizer.addTarget(self, action: #selector(tapRecognized))
        view.addGestureRecognizer(recognizer)
        
        minimumPlayerLabel.font = .minimumPlayer
        minimumPlayerLabel.text = "Minimální počet hráčů: \(minimumPlayerCount)"
        
        nameTextField.delegate = self
        nameTextField.placeholder = "Jméno hráče"
        nameTextField.font = .nameEnter
        nameTextField.layer.cornerRadius = 8
        nameTextField.textAlignment = .center
        nameTextField.returnKeyType = .done
        nameTextField.autocorrectionType = .no
        nameTextField.backgroundColor = .white
        
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.cellIdentifier)
        
        startButton.isHidden = true
        startButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            startButton,
            minimumPlayerLabel,
            tableView,
            nameTextField
            ])
        
        startButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(50)
        }
        
        minimumPlayerLabel.snp.makeConstraints { (make) in
            make.center.equalTo(startButton)
        }
        
        nameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(80)
            make.top.equalTo(startButton.snp.bottom).offset(10)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
