//
//  QuitButton.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


class QuitButton: UIButton {
    
    static let size: CGFloat = UIDevice.isPad ? 70 : 40
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: QuitButton.size, height: QuitButton.size)
    }
    
    init() {
        super.init(frame: .zero)
        
        setImage(UIImage.delete, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
