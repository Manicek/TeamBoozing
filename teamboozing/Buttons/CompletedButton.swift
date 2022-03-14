//
//  CompletedButton.swift
//
//  Created by Patrik Hora on 20/08/2018.
//

import UIKit


class CompletedButton: UIButton {
    
    static let size = UIDevice.isPad ? 150 : 80
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: CompletedButton.size, height: CompletedButton.size)
    }
    
    init() {
        super.init(frame: .zero)
        
        setImage(UIImage.completed, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
