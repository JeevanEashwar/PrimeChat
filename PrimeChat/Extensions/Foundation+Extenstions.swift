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
    static let LogOutSuccess = "User logged out successfully"
    
    /// This method checks if the string is a valid email using regex. april@gmail.com is a valid format for email.
    func isValidEmail() -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
    
    /// To check if string has a minimum of `minimum` characters in it.
    func hasMinimumNumberOfCharacters(_ minimum: UInt8) -> Bool {
        self.count >= minimum
    }
    
    /// "yyyy-MM-dd HH:mm:ss.SSSSSSZ" String to Date
    func toDate(using format: DateFormatter = .customFormat) -> Date? {
        return format.date(from: self)
    }
}


extension Date {
    func formattedString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: self)
    }
}

extension DateFormatter {
    static let customFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSSSSSZ"
        formatter.locale = Locale(identifier: "en_US_POSIX") // Set locale to ensure correct parsing
        formatter.timeZone = TimeZone(secondsFromGMT: 0) // Set the appropriate time zone here if needed
        return formatter
    }()
}
