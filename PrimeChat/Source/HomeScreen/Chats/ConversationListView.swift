//
//  ConversationListView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct ConversationListView: View {
    @StateObject var vm: ConversationListViewModal
    var body: some View {
        List {
            let messagesSorted = vm.messages.sorted { lhs, rhs in
                lhs.timeStamp < rhs.timeStamp
            }
            ForEach(messagesSorted, id: \.self.id) { item in
                let alignment = (item.receiverEmail == vm.contact.emailId) ? MessageAlignment.sent : MessageAlignment.received
                MessageCardView(message: item.message, timestamp: item.timeStamp.formattedString(), alignment: alignment)
                    .listRowSeparator(.hidden)
            }
        }
        .onAppear(){
            Task {
                await vm.loadConversations()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "person")
            }
            ToolbarItem(placement: .principal) {
                Text(vm.contact.displayName ?? vm.contact.emailId)
            }
        }
        .toolbarRole(.editor)
        Spacer()
        NewMessageContainerView(vm: vm)
    }
}

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView(vm: ConversationListViewModal(contact: Contact(emailId: "")))
    }
}
