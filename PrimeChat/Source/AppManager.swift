//
//  AppManager.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth

/// A class to adapt external module methods with application methods
class AppManager {
    
    /// Initializations and configurations of external modules
    static func configure() {
        FirebaseApp.configure()
    }
}

/// Firebase authentication methods
extension AppManager {
    
    /// Logged In user information - to be used in Profile section
    var loggedInUser: User? {
        Auth.auth().currentUser
    }
    
    /// Register the user using email and password
    @discardableResult
    static func signup(_ email: String, _ password: String) async -> String {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
        } catch(let error) {
            return error.localizedDescription
        }
        return .SignUpSuccess
    }
    
    /// Log in the user using email and password
    @discardableResult
    static func login(_ email: String, _ password: String) async -> String {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch(let error) {
            return error.localizedDescription
        }
        return .LoginSuccess
    }
}
