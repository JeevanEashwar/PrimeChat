//
//  UIKit+Extensions.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import UIKit

extension UIColor {
    
    /// Creates a UIColor instance using the hex string and optional alpha values passed
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    /// Primarily used App theme color as per the 60-30-10 rule
    static var primaryColor: UIColor {
        .init(hex: "#FF6F61")
    }
    
    /// Secondarily used App theme color as per the 60-30-10 rule
    static var secondaryColor: UIColor {
        .init(hex: "#F2F2F2")
    }
    
    /// Least used App theme color as per the 60-30-10 rule
    static var accentColor: UIColor {
        .init(hex: "#2E4057")
    }
}
