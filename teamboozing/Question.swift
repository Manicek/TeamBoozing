//
//  Question.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import Foundation

enum QuestionType: String {
    case single
    case all
}

class Question: NSObject, NSCoding {
    
    private let questionText: String
    let difficulty: Int
    let needsOpponent: Bool
    let type: QuestionType
    
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
    
    // MARK: NSCoding
    private static let questionTextKey = "questionText"
    private static let needsOpponentKey = "needsOpponent"
    private static let difficultyKey = "difficulty"
    private static let typeKey = "type"
    
    required init?(coder: NSCoder) {
        self.questionText = coder.decodeObject(forKey: Question.questionTextKey) as? String ?? "ErrorText"
        self.difficulty = coder.decodeObject(forKey: Question.difficultyKey) as? Int ?? 2
        self.needsOpponent = coder.decodeObject(forKey: Question.needsOpponentKey) as? Bool ?? false
        self.type = QuestionType(rawValue: coder.decodeObject(forKey: Question.typeKey) as? String ?? "single") ?? .single
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(questionText, forKey: Question.questionTextKey)
        coder.encode(difficulty, forKey: Question.difficultyKey)
        coder.encode(needsOpponent, forKey: Question.needsOpponentKey)
        coder.encode(type.rawValue, forKey: Question.typeKey)
    }
}
