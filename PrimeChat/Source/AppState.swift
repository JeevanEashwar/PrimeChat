//
//  AppState.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

enum AuthenticationScreen {
    case Login
    case SignUp
}

class AppState: ObservableObject {
    @Published var authScreen: AuthenticationScreen = .SignUp
}
