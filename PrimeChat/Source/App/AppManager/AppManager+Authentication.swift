//
//  AppManager+Authentication.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 05/10/23.
//

import Foundation
import FirebaseAuth

/// Firebase authentication methods
extension AppManager {
    
    /// Logged In user information - to be used in Profile section
    static var loggedInUser: User? {
        Auth.auth().currentUser
    }
    
    static var currentUserEmail: String {
        loggedInUser?.email ?? ""
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
