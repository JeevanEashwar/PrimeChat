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
                NavigationLink(destination: ConversationListView()) {
                    FaceCard(face: FaceModal(title: "Jeevan", subtitle: "Hi there!"))
                }
                NavigationLink(destination: ConversationListView()) {
                    FaceCard(face: FaceModal(title: "Eashwar", subtitle: "Lorem ipsum"))
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
