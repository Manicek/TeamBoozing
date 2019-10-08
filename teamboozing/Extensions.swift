//
//  Extensions.swift
//  teamboozing
//
//  Created by Patrik Hora on 17/08/2018.
//  Copyright © 2018 MasterApp. All rights reserved.
//

import UIKit

extension Int {
    static func random(_ upperBound: Int) -> Int {
        return Int(arc4random_uniform(UInt32(upperBound)))
    }
    
    /// Returns random Int between given bounds, inclusive. Swaps the bounds if lower > upper.
    static func randomBetween(_ lowerBound: Int, _ upperBound: Int) -> Int {
        if lowerBound > upperBound {
            return randomBetween(upperBound, lowerBound)
        }
        return random(upperBound - lowerBound + 1) + lowerBound
    }
}

extension MutableCollection where Index == Int {
    
    /// Shuffle the elements of `self` in-place.
    mutating func shuffle() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in startIndex ..< endIndex - 1 {
            let j = Int(arc4random_uniform(UInt32(endIndex - i))) + i
            if i != j {
                self.swapAt(i, j)
            }
        }
    }
}

extension UIColor {
    
    static var team1Color = UIColor(rgb: 150, 255, 255)
    static var team2Color = UIColor(rgb: 255, 150, 255)
    static var team3Color = UIColor(rgb: 255, 255, 150)
    
    static var background = UIColor(rgb: 226, 236, 255)
    
    convenience init(rgb red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}

extension UIViewController {
    
    /// Displays simple alert with message and title
    func showBasicAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "|||OK"), style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension UIView {
    
    func addSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}

extension UITableViewCell {
    
    static var cellIdentifier: String {
        return String(describing: self)
    }
}

extension String {
    static func stringWithHighlightedSubString(
        string: String,
        subString: String
        ) -> NSMutableAttributedString {
        
        var defaultAttributes: [NSAttributedString.Key : Any] = [:]
        var highlightedAttributes: [NSAttributedString.Key : Any] = [:]
        
        defaultAttributes.updateValue(UIColor.black, forKey: NSAttributedString.Key.foregroundColor)
        
        highlightedAttributes.updateValue(UIFont.questionHighlighted, forKey: NSAttributedString.Key.font)
        highlightedAttributes.updateValue(UIColor.white, forKey: NSAttributedString.Key.foregroundColor)
        highlightedAttributes.updateValue(UIColor.black, forKey: NSAttributedString.Key.strokeColor)
        highlightedAttributes.updateValue(-3, forKey: NSAttributedString.Key.strokeWidth)
        
        let textAttributedString = NSMutableAttributedString (
            string: string,
            attributes: defaultAttributes
        )
        
        let range = (string as NSString).range(of: subString)
        
        textAttributedString.addAttributes(
            highlightedAttributes,
            range: range)
        
        return textAttributedString
    }
}

extension UIDevice {
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
