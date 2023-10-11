//
//  PrimeChatApp.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI


/// Entry point to the application
@main
struct PrimeChatApp: App {
    
    init() {
        AppManager.configure()
    }
    
    @StateObject var appState: AppState = AppState()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appState)
        }
    }
}
