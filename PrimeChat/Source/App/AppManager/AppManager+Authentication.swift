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
    
    static var userDisplayName: String {
        if let displayName = loggedInUser?.displayName {
            return displayName
        } else if let username = currentUserEmail.components(separatedBy: "@").first {
            return username
        } else {
            return "Guest-" + UUID().uuidString
        }
    }
    
    static var photoUrl: URL? {
        loggedInUser?.photoURL
    }
    
    static func updateUserProfile(name: String? = nil, photoUrl: URL? = nil) {
        let changeRequest = loggedInUser?.createProfileChangeRequest()
        if let name = name {
            changeRequest?.displayName = name
        } else if let photoUrl = photoUrl {
            changeRequest?.photoURL = photoUrl
        }
        changeRequest?.commitChanges { error in
            if let error = error {
                print("Error updating display name: \(error.localizedDescription)")
            } else {
                print("Display name updated successfully to \(name)")
            }
        }
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
    
    /// Register the user using email and password
    @discardableResult
    static func logout() -> String {
        do {
            try Auth.auth().signOut()
        } catch(let error) {
            return error.localizedDescription
        }
        return .LogOutSuccess
    }
}
