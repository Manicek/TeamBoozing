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
    
    private let tableView = UITableView()
    private let nameTextField = UITextField()
    private let continueButton = ContinueButton()
    
    private var players = [Player(name: "Prvni"), Player(name: "Druhy"), Player(name: "Treti"), Player(name: "Ctvrty"), Player(name: "Paty")] //[Player]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        Game.createTeamsFromPlayers(players)
        navigationController?.pushViewController(TeamRostersViewController(), animated: true)
    }
}

extension EnterNamesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        addPlayer()
        return false
    }
}

extension EnterNamesViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlayerTableViewCell.cellIdentifier, for: indexPath) as! PlayerTableViewCell
        cell.configure(self, player: players[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players.count
    }
}

extension EnterNamesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

extension EnterNamesViewController: PlayerTableViewCellDelegate {
    
    func deletePlayer(_ player: Player) {
        var indexToDelete = -1
        for index in 0..<players.count {
            if players[index].name == player.name {
                indexToDelete = index
                break
            }
        }
        if indexToDelete > -1 {
            players.remove(at: indexToDelete)
        }
        checkPlayerCount()
        tableView.reloadData()
    }
}

private extension EnterNamesViewController {
    
    func addPlayer() {
        guard let name = nameTextField.text, !name.isEmpty else { return }
        for player in players {
            if player.name == name {
                showBasicAlert(message: "Jméno už je zabrané, vyber jiné", title: "Sorry!")
                return
            }
        }
        players.append(Player(name: name))
        checkPlayerCount()
        nameTextField.text = ""
        tableView.reloadData()
    }
    
    func checkPlayerCount() {
        continueButton.isEnabled = players.count > 3
    }
    
    func showReusePlayersAlert() {
        let reusePlayersAlert = UIAlertController(title: "Znovu!", message: "Chcete předvyplnit jména hráčů z minule?", preferredStyle: UIAlertControllerStyle.alert)
        
        let reuseAction = UIAlertAction(title: "Ano", style: .default) { (_) -> Void in
            self.players = [Player]()
            for team in Game.teams {
                for player in team.players {
                    self.players.append(player)
                }
            }
            self.checkPlayerCount()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Ne", style: .cancel)
        
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
        
        nameTextField.delegate = self
        nameTextField.placeholder = "Player name"
        nameTextField.font = .nameEnter
        nameTextField.layer.cornerRadius = 8
        nameTextField.textAlignment = .center
        nameTextField.returnKeyType = .done
        nameTextField.autocorrectionType = .no
        nameTextField.backgroundColor = .white
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.register(PlayerTableViewCell.self, forCellReuseIdentifier: PlayerTableViewCell.cellIdentifier)
        
        continueButton.isEnabled = false
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
    }
    
    func addSubviewsAndSetupConstraints() {
        view.addSubviews([
            tableView,
            nameTextField,
            continueButton
            ])
        
        nameTextField.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.height.equalTo(80)
            make.top.equalTo(topLayoutGuide.snp.bottom)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.75)
            make.top.equalTo(nameTextField.snp.bottom).offset(10)
            make.bottom.equalTo(continueButton.snp.top).offset(-10)
        }
        
        continueButton.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(40)
        }
    }
}
