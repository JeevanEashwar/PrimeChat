//
//  Foundation+Extenstions.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation

extension String {
    static let SignUpSuccess = "User signed up successfully"
    static let LoginSuccess = "User logged in successfully"
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    func hasMinimumNumberOfCharacters(_ minimum: UInt8) -> Bool {
        self.count >= minimum
    }
}
