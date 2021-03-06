//
//  QuitButton.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

class QuitButton: UIButton {
    
    static let size: CGFloat = UIDevice.isPad ? 70 : 40
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: QuitButton.size, height: QuitButton.size)
    }
    
    init() {
        super.init(frame: .zero)
        
        setImage(UIImage.delete, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
