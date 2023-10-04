//
//  AppManager.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import FirebaseCore
import FirebaseAuth

class AppManager {
    static func configure() {
        FirebaseApp.configure()
    }
}

extension AppManager {
    
    var loggedInUser: User? {
        Auth.auth().currentUser
    }
    
    @discardableResult
    static func signup(_ email: String, _ password: String) async -> String {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
        } catch(let error) {
            return error.localizedDescription
        }
        return .SignUpSuccess
    }
    
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
