//
//  ChatsListView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct ChatsListView: View {
    @StateObject private var vm = AddContactViewModal(contacts: [])
    
    var body: some View {
        NavigationView {
            List {
                ForEach(vm.contacts, id: \.self.emailId) { item in
                    NavigationLink(destination: ConversationListView()) {
                        FaceCard(face: FaceModal(title: item.displayName ?? item.emailId, subtitle: item.recentMessage ?? ""))
                    }
                }
            }
            .navigationTitle("Chats")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddContactView(vm: vm)) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

struct ChatsListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatsListView()
    }
}
