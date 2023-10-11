//
//  HomeContainerView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct HomeContainerView: View {
    @EnvironmentObject var appState: AppState
    init() {
        UITabBar.appearance().tintColor = UIColor.primaryColor
    }
    var body: some View {
        TabView {
            ChatsListView()
                .tabItem {
                    Image(systemName: "quote.bubble.fill")
                    Text("Chats")
                }
            StatusListView()
                .tabItem {
                    Image(systemName: "photo.circle.fill")
                    Text("Status")
                }
                .accentColor(Color(.accentColor))
            ProfileSettingsView()
                .tabItem {
                    Image(systemName: "gear.circle.fill")
                    Text("Settings")
                }
                .accentColor(Color(.accentColor))
        }
    }
}

struct HomeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContainerView()
    }
}
