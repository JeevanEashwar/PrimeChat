//
//  ProfileSettingsView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct ProfileSettingsView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Profile Detail View")) {
                    Text("Profile Setting 1")
                }
                NavigationLink(destination: Text("Profile Detail View")) {
                    Text("Profile Setting 2")
                }
            }
            .navigationTitle("Profile Settings")
        }
    }
}
struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
