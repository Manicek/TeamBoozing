//
//  QuitButton.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class QuitButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        
        setImage(#imageLiteral(resourceName: "delete"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
