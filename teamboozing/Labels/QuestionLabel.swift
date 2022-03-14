//
//  QuestionLabel.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


class QuestionLabel: UILabel {

    init() {
        super.init(frame: .zero)
        
        makeMultiline()
        textAlignment = .center
        font = .questionDefault
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
