//
//  ContentView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

/// Main ContainerView which is the parent view for all the application View's 
struct ContentView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        switch appState.authScreen {
        case .Login:
            LoginView()
        case .SignUp:
            SignUpView()
        case .HomeContainer:
            HomeContainerView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AppState())
    }
}
