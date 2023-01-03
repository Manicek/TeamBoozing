//
//  Fonts.swift
//
//  Created by Patrik Hora on 28/12/2018.
//

import UIKit


extension UIFont {
    
    static let questionDefault = font(32)
    static let questionHighlighted = font(40)
    static let questionSet = font(24)
    static let membersSmall = font(24)
    static let membersLarge = font(28)
    static let minimumPlayer = font(24)
    static let startButton = font(24)
    static let judge = font(20)
    static let continueButton = font(24)
    static let playerCell = font(24)
    static let nameEnter = font(24)
    static let drinkCount = font(40)
    
    private static func font(_ size: CGFloat) -> UIFont {
        systemFont(ofSize: UIDevice.current.userInterfaceIdiom == .pad ? (size * 2) : size)
    }
}
