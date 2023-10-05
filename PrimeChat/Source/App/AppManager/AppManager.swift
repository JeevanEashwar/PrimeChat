//
//  AppManager.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import Firebase
import FirebaseFirestore

/// A class to adapt external module methods with application methods
class AppManager {
    
    /// Initializations and configurations of external modules
    static func configure() {
        FirebaseApp.configure()
    }
}

extension AppManager {
    static func getDateFromFIRTimeStamp(dictionary: [String: Any]) -> Date? {
        if let ts = dictionary["timeStamp"] as? Timestamp {
            let timestampInSeconds = TimeInterval(ts.seconds)
            let date = Date(timeIntervalSince1970: timestampInSeconds)
            return date
        }
        return nil
    }
}
