//
//  QuestionLabel.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class QuestionLabel: UILabel {

    init() {
        super.init(frame: .zero)
        
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
        textAlignment = .center
        font = .questionDefault
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
