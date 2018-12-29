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
    
    static var allQuestions: [Question] {
        return originalQuestions + silvesterQuestions
    }
    
    static let silvesterQuestions = [
        Question("sundej si tričko", difficulty: 3)
    ]
    
    static let originalQuestions = [
        Question("jmenuj pět dobrých vlastností svého šéfa", difficulty: 3),
        Question("kdy má <SOUPER> narozeniny?", needsOpponent: true),
        Question("jakého má domácího mazlíčka <SOUPER>?", difficulty: 1, needsOpponent: true),
        Question("řekni třikrát za sebou správně jazykolam \"Pudl prdl pudr\"", difficulty: 1),
        Question("popiš náplň práce <SOUPER>", difficulty: 1, needsOpponent: true),
        Question("co je nejoblíbenější jídlo <SOUPER>?", needsOpponent: true),
        Question("co je nejoblíbenější alkoholický nápoj <SOUPER>?", needsOpponent: true),
        Question("řekni své jméno pozpátku", difficulty: 1),
        Question("vyhláskuj jméno <SOUPER>", difficulty: 1, needsOpponent: true),
        Question("který hráč je nejmenší?"),
        Question("který hráč je nejvyšší?"),
        Question("co je nejoblíbenější volnočasová činnost <SOUPER>?", needsOpponent: true),
        Question("seřaď kolegy podle doby působení ve firmě", difficulty: 3),
        Question("vyjmenuj hráče, kteří mají děti"),
        Question("který hráč bydlí nejdále od firmy?", difficulty: 3),
        Question("který hráč byl naposledy na dovolené a kde?"),
        Question("udělej hlasitě zvuk prdu. Nikdo z týmu se nesmí zasmát", difficulty: 1),
        Question("se nesmí po dobu 15 sekund smát"),
        Question("kdo z hráčů je vegetarián/vegan?"),
        Question("postav se a agresivně propaguj Šmouly", difficulty: 3),
        Question("který hráč je nejmladší?"),
        Question("vyjmenuj hráče, kteří mají rádi Pokémony", difficulty: 3),
        Question("zazpívej písničku"),
        Question("řekni krátkou básničku/říkanku"),
        Question("zazpívej národní hymnu", difficulty: 3),
        Question("zatancuj si valčík s někým z týmu", difficulty: 3),
        Question("zahraj scénku z Matrixu, kdy Neo uhýbá střelbě", difficulty: 3),
        Question("zarepuj o firmě alespoň pár rýmů", difficulty: 3),
        Question("přeběhni místnost tam a zpátky a přitom volej \"Run Forrest, run!\"", difficulty: 3),
        Question("zamňoukej, zaštěkej a zatrub jako slon", difficulty: 1),
        Question("vyfoť týmové selfie, kde všichni dělají duck face", difficulty: 3),
        Question("odpověz pravdivě na otázku od <SOUPER> dle jejich výběru", needsOpponent: true),
        Question("řekni vtip, který rozesměje někoho z jiného týmu"),
        Question("vyskákej na jedné noze dvě kolečka kolem své vlastní osy a volej u toho: \"Jsem hvězda!\""),
        Question("<SOUPER> řekne jednu pravdu a jednu lež. Uhádni co byla pravda", difficulty: 3, needsOpponent: true),
        Question("zatancuj exotický tanec"),
        Question("napij se z nápoje souseda po pravici", difficulty: 1),
        Question("napij se z nápoje souseda po levici", difficulty: 1),
        Question("vymysli přezdívku pro ostatní hráče"),
        Question("popiš všechny ostatní hráče (dohromady) pomocí jednoho slova", difficulty: 1),
        Question("prones proslov na počest své firmy se silným francouzským přízvukem", difficulty: 1),
        Question("květnatě popiš vůni a chuť svého nápoje", difficulty: 1),
        Question("popiš náplň svojí práce se silným indickým přízvukem"),
        Question("řekni abecedu pozpátku do 30 sekund", difficulty: 3),
        Question("vyměň si nápoj s někým ze svého týmu"),
        Question("Sedni si na zem!", type: .all),
        Question("Lehni si na zem!", type: .all),
        Question("Zvedni levou ruku!", type: .all),
        Question("Zvedni pravou ruku!", type: .all),
        Question("Dotkni se stolu malíčkem!", type: .all),
        Question("Dotkni se čela ukazováčkem!", type: .all),
        Question("Dotkni se stolu čelem!", type: .all),
        Question("Dotkni se čela prsteníčkem!", type: .all),
        Question("Každý z týmu vybere šampióna a hraje se kámen-nůžky-papír: kdo prohraje, ten pije", type: .all),
        Question("Zvedni svůj nápoj!", type: .all),
        Question("Stůj co nejdéle na jedné noze!", type: .all),
        Question("Zatancuj břišní tanec!", type: .all)
    ]
}
