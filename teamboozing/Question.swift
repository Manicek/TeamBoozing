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
        return /*originalQuestions +*/ silvesterQuestions
    }
    
    // Thanks to Koty and https://conversationstartersworld.com/truth-dare-questions/?fbclid=IwAR0FwOKVWdzM1OlNtQAy3v9S2enIfQdSuXjQZPgJVSXNFJkWSQ9T88qkhTo for many of the questions below
    static let silvesterQuestions = [
        Question("kdybys byl/a opačné sexuality, s kterým hráčem bys to chtěl/a dělat?"),
        Question("co nejdražšího jsi ukradl/a?"),
        Question("popiš detailně fotku, na které vypadáš nejtrapněji"),
        Question("přiznej svůj netrapnější zlozvyk"),
        Question("popiš svůj nejdivočejší zážitek s policií"),
        Question("čeho nebo se nejvíce bojíš?"),
        Question("popiš nevhodnou situaci, ve které sis prdnul/a"),
        Question("proč ses rozešel/rozešla s předchozím přítelem?"),
        Question("kdo z hráčů je nejvíce sexy? A kdo je druhý a třetí nejvíce sexy?"),
        Question("co nejdivnějšího jsi při sexu dělal/a?", difficulty: 4),
        Question("řekni o sobě něco co nikdo z přítomných neví"),
        Question("jakou nejtrapnější přezdívku jsi měl/a?"),
        Question("popiš nejdivnější příhodu kdy jsi zvracel/a"),
        Question("co bys dělal/a kdyby ses na jeden den probudil/a jako opačné pohlaví?", difficulty: 1),
        Question("tancuj 30 sekund bez hudby", difficulty: 3),
        Question("nech ostatní hráče aby tě jakkoliv napózovali a vyfotili se s tebou"),
        Question("ztvárni svůj život krátkým interpretačním tancem"),
        Question("olízni podlahu", difficulty: 3),
        Question("vypij panáka kterého ti vytvoří a namíchají ostatní", difficulty: 5),
        Question("nech ostatní hráče, aby ti napsali fixem něco na tělo", difficulty: 3),
        Question("nech ostatní hráče, aby ti udělali jakýkoliv účes", difficulty: 3),
        Question("breakdancuj 30 sekund"),
        Question("dej hráči po levici pusu"),
        Question("předveď červa, na zemi"),
        Question("pokus se o kouzelnický trik"),
        Question("přejdi z jednoho konce pokoje na druhý po rukou, spoluhráč ti může držet nohy"),
        Question("otáčej kolem sebe 30 sekund imaginarní hula hop"),
        Question("běž na záchod, sundej si trenky/kalhotky a nos je na hlavě až do konce hry", difficulty: 6),
        Question("sněz 15 SECALO do 30 sekund, bez zapíjení"),
        Question("sundej si tričko", difficulty: 5),
        Question("dej si panáka něčeho alespoň 40%", difficulty: 3),
        Question("řekni, který z mužských hráčů má podle tebe nejmenší penis"),
        Question("udělej 5 kliků"),
        Question("řekni křestní jména všech hráčů"),
        Question("kterému hráči podle tebe nejvíc smrdí nohy?"),
        // MARK: Needs Opponent
        Question("chovej se 30 sekund jako zvíře, které vybere <SOUPER>", needsOpponent: true),
        Question("slož krátkou báseň na základě tří slov, které vybere <SOUPER>", needsOpponent: true),
        Question("nech <SOUPER>, aby ti napráskal/a na zadek", difficulty: 3, needsOpponent: true),
        Question("postni na Facebook fotku dle svého výběru z pěti fotek které ti nafotí <SOUPER> na tvůj telefon", difficulty: 3, needsOpponent: true),
        Question("prodej <SOUPER> nějakou sračku, použij k tomu své nejlepší prodejní schopnosti", needsOpponent: true),
        Question("tanči na písničku, kterou vybere <SOUPER>, jako by na tom závisel tvůj život", difficulty: 3, needsOpponent: true),
        Question("má <SOUPER> radši vodku nebo rum?", needsOpponent: true),
        //MARK: All
        Question("Napij se!", type: .all),
        Question("Vyplázni jazyk!", type: .all),
        Question("Zasalutuj!", type: .all),
        Question("Postav se na jednu nohu!", type: .all),
        Question("Ukaž na strop!", type: .all),
        Question("Zatwerkuj!", type: .all),
        Question("Ukaž na nejbližší vodku!", type: .all),
        Question("Dej si facku!", type: .all)
    ]
    
    static let originalQuestions = [
        Question("jmenuj pět dobrých vlastností svého šéfa", difficulty: 3),
        Question("řekni své jméno pozpátku", difficulty: 1),
        Question("řekni třikrát za sebou správně jazykolam \"Pudl prdl pudr\"", difficulty: 1),
        Question("který hráč je nejmenší?"),
        Question("který hráč je nejvyšší?"),
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
        Question("řekni vtip, který rozesměje někoho z jiného týmu"),
        Question("vyskákej na jedné noze dvě kolečka kolem své vlastní osy a volej u toho: \"Jsem hvězda!\""),
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
        // MARK: Needs Opponent
        Question("<SOUPER> řekne jednu pravdu a jednu lež. Uhádni co byla pravda", difficulty: 3, needsOpponent: true),
        Question("odpověz pravdivě na otázku od <SOUPER> dle jejich výběru", needsOpponent: true),
        Question("popiš náplň práce <SOUPER>", difficulty: 1, needsOpponent: true),
        Question("co je nejoblíbenější jídlo <SOUPER>?", needsOpponent: true),
        Question("co je nejoblíbenější alkoholický nápoj <SOUPER>?", needsOpponent: true),
        Question("vyhláskuj jméno <SOUPER>", difficulty: 1, needsOpponent: true),
        Question("jakého má domácího mazlíčka <SOUPER>?", difficulty: 1, needsOpponent: true),
        Question("kdy má <SOUPER> narozeniny?", needsOpponent: true),
        Question("co je nejoblíbenější volnočasová činnost <SOUPER>?", needsOpponent: true),
        // MARK: All
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
