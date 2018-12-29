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
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: super.intrinsicContentSize.width, height: UIDevice.isPad ? 75 : 50)
    }

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        
        titleLabel?.font = .continueButton
        setTitleColor(.black, for: .normal)
        setTitle("Continue", for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}
