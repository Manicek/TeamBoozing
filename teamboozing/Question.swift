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
    
    func text(player: Player? = nil, opponent: Player? = nil) -> String {
        if type == .all {
            return questionText
        }
        
        var fixedText = questionText
        if let player = player {
            fixedText = fixedText.replacingOccurrences(of: "<HRAC>", with: player.name)
        }
        if let opponent = opponent, needsOpponent {
            fixedText = fixedText.replacingOccurrences(of: "<SOUPER>", with: opponent.name)
        }
        return fixedText
    }
    
    static let allQuestions = [
        Question("<HRAC>, jmenuj pět dobrých vlastností svého šéfa", difficulty: 3),
        Question("Sedni si na zem!", type: .all),
        Question("Lehni si na zem!", type: .all),
        Question("Zvedni levou ruku!", type: .all),
        Question("<HRAC>, kdy má <SOUPER> narozeniny?", needsOpponent: true),
        Question("<HRAC>, jakého má domácího mazlíčka <SOUPER>?", difficulty: 1, needsOpponent: true),
        Question("<HRAC>, řekni třikrát za sebou správně jazykolam \"Pudl prdl pudr\"", difficulty: 1),
        Question("<HRAC>, popiš náplň práce <SOUPER>", difficulty: 1, needsOpponent: true),
        Question("<HRAC>, co je nejoblíbenější jídlo <SOUPER>?", needsOpponent: true),
        Question("<HRAC>, co je nejoblíbenější alkoholický nápoj <SOUPER>?", difficulty: 1, needsOpponent: true),
        Question("<HRAC>, řekni své jméno pozpátku", difficulty: 1),
        Question("<HRAC>, vyhláskuj jméno <SOUPER>", difficulty: 1, needsOpponent: true),
        Question("Zvedni pravou ruku!", type: .all),
        Question("Dotkni se stolu malíčkem!", type: .all),
        Question("Dotkni se čela ukazováčkem!", type: .all),
        Question("Dotkni se stolu čelem!", type: .all),
        Question("Dotkni se čela prsteníčkem!", type: .all),
        Question("<HRAC>, kdo je nejmenší človek z těch co hrají?"),
        Question("<HRAC>, kdo je nejvyšší človek z těch co hrají?"),
        Question("<HRAC>, co je nejoblíbenější volnočasová činnost <SOUPER>?", needsOpponent: true),
        Question("<HRAC>, seřaď kolegy podle doby působení ve firmě", difficulty: 3),
        Question("<HRAC>, vyjmenuj hráče, kteří mají děti"),
        Question("<HRAC>, který hráč bydlí nejdále od firmy?", difficulty: 3),
        Question("<HRAC>, který hráč byl naposledy na dovolené a kde?"),
        Question("<HRAC>, udělej hlasitě zvuk prdu. Nikdo z týmu se nesmí zasmát", difficulty: 1),
        Question("<HRAC>, se nesmí po dobu 15 sekund smát"),
        Question("<HRAC>, kdo je vegetarián/vegan?"),
        Question("<HRAC>, postav se a agresivně propaguj Šmouly", difficulty: 3),
        Question("<HRAC>, který hráč je nejmladší?"),
        Question("<HRAC>, vyjmenuj hráče, kteří mají rádi Pokémony", difficulty: 3),
        Question("Každý z týmu vybere šampióna a hraje se kámen-nůžky-papír: kdo celkově prohraje, ten pije", type: .all),
        Question("<HRAC>, zazpívej písničku"),
        Question("<HRAC>, řekni krátkou básničku/říkanku"),
        Question("<HRAC>, zazpívej národní hymnu", difficulty: 3),
        Question("<HRAC>, zatancuj si valčík s někým z týmu", difficulty: 3),
        Question("<HRAC>, zahraj scénku z Matrixu, kdy Neo uhýbá střelbě", difficulty: 3),
        Question("<HRAC>, zarepuj o firmě alespoň pár rýmů", difficulty: 3),
        Question("<HRAC>, přeběhni místnost tam a zpátky a přitom volej \"Run Forrest, run!\"", difficulty: 1),
        Question("<HRAC>, zamňoukej, zaštěkej a zatrub jako slon", difficulty: 1),
        Question("<HRAC>, vyfoť týmové selfie, kde všichni dělají duck face", difficulty: 3),
        Question("<HRAC>, odpověz pravdivě na otázku od <SOUPER> dle jejich výběru", needsOpponent: true),
        Question("<HRAC>, řekni vtip, který rozesměje někoho z jiného týmu"),
        Question("<HRAC>, vyskákej na jedné noze dvě kolečka kolem své vlastní osy a volej u toho: \"Jsem hvězda!\""),
        Question("<SOUPER> řekne jednu pravdu a jednu lež. <HRAC>, co byla pravda", difficulty: 3, needsOpponent: true),
        Question("<HRAC>, zatancuj exotický tanec"),
        Question("<HRAC>, napij se z nápoje souseda po pravici", difficulty: 1),
        Question("<HRAC>, napij se z nápoje souseda po levici", difficulty: 1),
        Question("<HRAC>, vymysli přezdívku pro ostatní hráče", difficulty: 1),
        Question("<HRAC>, popiš všechny ostatní hráče pomocí jednoho slova", difficulty: 1),
        Question("<HRAC>, prones proslov na počest firmy se silným francouzským přízvukem", difficulty: 1),
        Question("<HRAC>, květnatě popiš vůni a chuť svého nápoje", difficulty: 1),
        Question("<HRAC>, popiš náplň svojí práce se silným indickým přízvukem"),
        Question("Zvedni svůj nápoj!", type: .all),
        Question("<HRAC>, řekni abecedu pozpátku", difficulty: 3),
        Question("<HRAC>, vyměň si nápoj s někým ze svého týmu"),
        Question("Stůj co nejdéle na jedné noze!", type: .all),
        Question("Zatancuj břišní tanec!", type: .all)
    ]
}
