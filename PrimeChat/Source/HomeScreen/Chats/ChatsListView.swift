//
//  ChatsListView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct ChatsListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Chat Detail View")) {
                    Text("Chat Item 1")
                }
                NavigationLink(destination: Text("Chat Detail View")) {
                    Text("Chat Item 2")
                }
            }
            .navigationTitle("Chats")
        }
    }
}

struct ChatsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsListView()
    }
}
