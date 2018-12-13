//
//  ContinueButton.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class ContinueButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1 : 0.5
        }
    }

    init() {
        super.init(frame: .zero)
        
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        setTitleColor(.black, for: .normal)
        setTitle("Continue", for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}
