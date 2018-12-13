//
//  DrinkButton.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class DrinkButton: UIButton {

    private(set) var team: Team?
    
    init(team: Team? = nil) {
        super.init(frame: .zero)
        
        setImage(#imageLiteral(resourceName: "beer"), for: .normal)
        
        self.team = team
        if let color = team?.color {
            backgroundColor = color
            layer.cornerRadius = 35
        }
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
