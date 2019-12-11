//
//  Question.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import Foundation

enum QuestionType {
    case single
    case all
}

class Question {
    
    let needsOpponent: Bool
    private let questionText: String
    let type: QuestionType
    let difficulty: Int
    
    init(_ text: String, difficulty: Int = 2, needsOpponent: Bool = false, type: QuestionType = .single) {
        self.questionText = text
        self.difficulty = difficulty
        self.needsOpponent = needsOpponent
        self.type = type
    }
    
    func allText() -> String {
        return questionText
    }
    
    func text(player: Player, opponent: Player? = nil) -> NSMutableAttributedString {
        var baseText = questionText
        if let opponent = opponent, needsOpponent {
            baseText = baseText.replacingOccurrences(of: "<SOUPER>", with: opponent.name)
        }
        
        let textWithPlayer = player.name + ", " + baseText
        return String.stringWithHighlightedSubString(string: textWithPlayer, subString: player.name)
    }
    
}
