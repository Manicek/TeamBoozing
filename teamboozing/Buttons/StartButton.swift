//
//  StartButton.swift
//
//  Created by Patrik Hora on 29/12/2018.
//

import UIKit


class StartButton: UIButton {
    
    static let size: CGFloat = UIDevice.isPad ? 75 : 50
    private(set) var team: Team?
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: super.intrinsicContentSize.width, height: StartButton.size)
    }
    
    init() {
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
        
        titleLabel?.font = .startButton
        setTitleColor(.black, for: .normal)
        setTitle("Začít hru", for: .normal)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = frame.height / 2
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
