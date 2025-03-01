//
//  UIColor+Extension.swift
//  LevelSuperMind
//
//  Created by Cedcoss on 28/02/25.
//

import UIKit

extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.currentIndex = hex.startIndex
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let g = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let b = CGFloat(rgb & 0xFF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

extension UIColor {
    static let appBackground = UIColor(hex: "#0D0715")
    static let secondaryBackgroundColor = UIColor(hex: "#38216A")
    static let tabBarSelected = UIColor.white
    static let tabBarUnselected = UIColor.gray
    static let headerLabelcolor = UIColor.white
    static let blueLabelcolor = UIColor(hex: "#6A6CFA")
    static let blurBackgroundColor = UIColor.black.withAlphaComponent(0.6)
    static let secondaryTextColor = UIColor(hex: "#5B4B6C")
}
