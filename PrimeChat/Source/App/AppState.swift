//
//  AppState.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

/// Authentication Navigation flow will have three screens
/// - Login: User can enter email and password to log into a session
/// - Sign Up: Register using email and password
/// - HomeContainer: Once loggedIn, this is the first screen the user is navigated to. This contains the User Chats, Account, Settings etc.,
enum AuthenticationScreen {
    case Login
    case SignUp
    case HomeContainer
}

/// Managed applicaition state 
class AppState: ObservableObject {
    @Published var authScreen: AuthenticationScreen = .Login
}
