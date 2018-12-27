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
    static let drunkCoefficient = 2
    
    private(set) static var teams = [Team]()
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
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.setViewControllers([vc], animated: true)
    }
    
    static func start() {
        currentTeamIndex = 0
        orderedQuestions = Question.allQuestions.shuffled()
        navigationController.setNavigationBarHidden(true, animated: false)
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
    
    static func showEndAlert(from vc: UIViewController) {
        let clearAlert = UIAlertController(title: "End", message: "Are you sure?", preferredStyle: UIAlertControllerStyle.alert)
        
        let endAction = UIAlertAction(title: "End game", style: .destructive) {
            (result : UIAlertAction) -> Void in
            
            Game.end()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) {
            (result : UIAlertAction) -> Void in
        }
        
        clearAlert.addAction(endAction)
        clearAlert.addAction(cancelAction)
        
        vc.present(clearAlert, animated: true, completion: nil)
    }
    
    private static func end() {
        let vc = EndViewController()
        navigationController.setViewControllers([vc], animated: true)
    }

}
