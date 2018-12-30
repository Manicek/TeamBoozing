//
//  CompletedButton.swift
//  teamboozing
//
//  Created by Patrik Hora on 20/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class CompletedButton: UIButton {
    
    static let size = UIDevice.isPad ? 150 : 80
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: CompletedButton.size, height: CompletedButton.size)
    }
    
    init() {
        super.init(frame: .zero)
        
        setImage(#imageLiteral(resourceName: "completed"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
