//
//  ContinueButton.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


class ContinueButton: UIButton {
    
    static let height: CGFloat = UIDevice.isPad ? 75 : 50

    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        
        titleLabel?.font = .continueButton
        setTitleColor(.black, for: .normal)
        setTitle("Pokračovat", for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
