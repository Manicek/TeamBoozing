//
//  Extensions.swift
//
//  Created by Patrik Hora on 17/08/2018.
//

import UIKit


// MARK: - UIColor

extension UIColor {
    
    static var team1Color = UIColor(rgb: 150, 255, 255)
    static var team2Color = UIColor(rgb: 255, 150, 255)
    static var team3Color = UIColor(rgb: 255, 255, 150)
    
    static var background = UIColor(rgb: 226, 236, 255)
    
    convenience init(rgb red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1.0) {
        self.init(red: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: alpha)
    }
}


// MARK: - UIViewController

extension UIViewController {
    
    /// Displays simple alert with message and title
    func showBasicAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: NSLocalizedString("ok", comment: "|||OK"), style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}


// MARK: - UIView

extension UIView {
    
    func addSubviews(_ subviews: [UIView]) {
        for subview in subviews {
            addSubview(subview)
        }
    }
}


// MARK: - UITableViewCell

extension UITableViewCell {
    
    static var cellIdentifier: String {
        String(describing: self)
    }
}


// MARK: - String

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


// MARK: - UIDevice

extension UIDevice {
    
    static var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}


// MARK: - UIImage

extension UIImage {
    
    static var beer = UIImage(named: "beer")
    static var completed = UIImage(named: "completed")
    static var delete = UIImage(named: "delete")
}


// MARK: - UILabel

extension UILabel {
    
    func makeMultiline() {
        numberOfLines = 0
        lineBreakMode = .byWordWrapping
    }
}
