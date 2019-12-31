//
//  Game.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class Game {
    
    private init() {}
    
    static let navigationController = UINavigationController(rootViewController: EnterNamesViewController())
    
    private(set) static var teams = [Team]()
    private(set) static var questionSetsNames = [String]()
    private static var currentTeamIndex = -1
    private static var orderedQuestions = [Question]()
    
    static func createTeamsFromPlayers(_ players: [Player]) {
        teams = [Team]()
        if players.count < 4 { return }
        
        teams.append(Team(color: .team1Color))
        teams.append(Team(color: .team2Color))
        
        if players.count > 5 {
            teams.append(Team(color: .team3Color))
        }
        
        let randomizedPlayers = players.shuffled()
        
        var teamIndex = 0
        for player in randomizedPlayers {
            teams[teamIndex].addPlayer(player)
            teamIndex = (teamIndex + 1 < teams.count) ? (teamIndex + 1) : 0
        }
    }
    
    static func restart() {
        let vc = EnterNamesViewController()
        navigationController.setViewControllers([vc], animated: true)
    }
    
    static func start(questions: [Question]) {
        navigationController.setNavigationBarHidden(true, animated: false)
        currentTeamIndex = 0
        orderedQuestions = questions.shuffled()
        showNextQuestion()
    }
    
    static func showDrinkScreen(for team: Team, difficulty: Int) {
        let vc = DrinkViewController(team: team, difficulty: difficulty)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    static func showNextQuestion() {
        guard let question = orderedQuestions.popLast() else {
            end()
            return
        }
        
        if question.type == .single {
            let currentTeam = teams[currentTeamIndex]
            var opponent: Player?
            if question.needsOpponent {
                var allOpponents = [Player]()
                for index in 0..<teams.count {
                    if index == currentTeamIndex { continue }
                    allOpponents.append(contentsOf: teams[index].players)
                }
                allOpponents = allOpponents.shuffled()
                opponent = allOpponents.first!
            }
            let questionText = question.text(player: currentTeam.randomPlayer, opponent: opponent)
            let vc = TeamQuestionViewController(team: currentTeam, questionText: questionText, difficulty: question.difficulty)
            navigationController.setViewControllers([vc], animated: true)
            currentTeamIndex = (currentTeamIndex + 1 < teams.count) ? (currentTeamIndex + 1) : 0
        } else {
            let vc = AllQuestionViewController(question: question)
            navigationController.setViewControllers([vc], animated: true)
        }
    }
    
    static func drinksForPosition(team: Team) -> Int {
        let orderedTeams = teams.sorted { (team1, team2) -> Bool in
            return team1.drinks > team2.drinks
        }
        return (orderedTeams.firstIndex(of: team) ?? 0)
    }
    
    static func showEndAlert(from vc: UIViewController) {
        let clearAlert = UIAlertController(title: "Konec", message: "Jste si jistí?", preferredStyle: UIAlertController.Style.alert)
        
        let endAction = UIAlertAction(title: "Ukončit hru", style: .destructive) { (_) in
            
            Game.end()
        }
        let cancelAction = UIAlertAction(title: "Pokračovat", style: .default)
        
        clearAlert.addAction(endAction)
        clearAlert.addAction(cancelAction)
        
        vc.present(clearAlert, animated: true, completion: nil)
    }
    
    private static func end() {
        navigationController.setNavigationBarHidden(true, animated: false)
        let vc = EndViewController()
        navigationController.setViewControllers([vc], animated: true)
    }

}
