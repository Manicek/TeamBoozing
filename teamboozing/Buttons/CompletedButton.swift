//
//  CompletedButton.swift
//  teamboozing
//
//  Created by Patrik Hora on 20/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class CompletedButton: UIButton {
    
    init() {
        super.init(frame: .zero)
        
        setImage(#imageLiteral(resourceName: "completed"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
