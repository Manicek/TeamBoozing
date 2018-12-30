//
//  DrinkButton.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class DrinkButton: UIButton {

    static let size: CGFloat = UIDevice.isPad ? 150 : 80
    private(set) var team: Team?
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: DrinkButton.size, height: DrinkButton.size)
    }
    
    init(team: Team? = nil) {
        super.init(frame: .zero)
        
        setImage(#imageLiteral(resourceName: "beer"), for: .normal)
        
        self.team = team
        if let color = team?.color {
            backgroundColor = color
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
