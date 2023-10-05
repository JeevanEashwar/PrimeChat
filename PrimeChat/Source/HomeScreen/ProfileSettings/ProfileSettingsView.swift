//
//  ProfileSettingsView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct ProfileSettingsView: View {
    @EnvironmentObject var appState: AppState
    var body: some View {
        NavigationView {
            VStack {
                List {
                    NavigationLink(destination: Text("Profile Detail View")) {
                        Text("Profile Setting 1")
                    }
                    NavigationLink(destination: Text("Profile Detail View")) {
                        Text("Profile Setting 2")
                    }
                }
                .navigationTitle("Profile Settings")
                
                Button(action: {
                    Task {
                        let message = AppManager.logout()
                        if message == .LogOutSuccess {
                            self.appState.authScreen = .Login
                        }
                    }
                }) {
                    Text("Sign out")
                        .frame(width: 120, height: 44)
                        .background(Color(.primaryColor))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                }
            }
            
        }
    }
}
struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
