//
//  HomeContainerView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct HomeContainerView: View {
    var body: some View {
            TabView {
                ChatsListView()
                    .tabItem {
                        Image(systemName: "bubble.left.fill")
                            .foregroundColor(Color(.accentColor))
                        Text("Chats")
                    }
                StatusListView()
                    .tabItem {
                        Image(systemName: "photo.circle.fill")
                            .foregroundColor(Color(.accentColor))
                        Text("Status")
                    }
                ProfileSettingsView()
                    .tabItem {
                        Image(systemName: "person")
                            .foregroundColor(Color(.accentColor))
                        Text("Profile")
                    }
            }
        }
}

struct HomeContainerView_Previews: PreviewProvider {
    static var previews: some View {
        HomeContainerView()
    }
}
