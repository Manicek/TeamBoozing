//
//  Fonts.swift
//  teamboozing
//
//  Created by Patrik Hora on 28/12/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

extension UIFont {
    static var questionDefault = font(32)
    static var questionHighlighted = font(40)
    static var membersSmall = font(24)
    static var membersLarge = font(28)
    static var minimumPlayer = font(24)
    static var startButton = font(24)
    static var continueButton = font(24)
    static var playerCell = font(24)
    static var nameEnter = font(24)
    static var drinkCount = font(32)
    
    private static func font(_ size: CGFloat) -> UIFont {
        return systemFont(ofSize: UIDevice.current.userInterfaceIdiom == .pad ? (size * 1.5) : size)
    }
}
