//
//  ConversationListView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct ConversationListView: View {
    var body: some View {
        List {
            MessageCardView(message: "Hi there!", timestamp: "11:45 AM", alignment: .received)
                .listRowSeparator(.hidden)
            MessageCardView(message: "This is a very long test string to test multiple line view in conversation list view as a sent message without the need of actual message string. This is just to simulate and only for the demonstaration puprposes Not to be confused as an actual message", timestamp: "10:30 AM", alignment: .sent)
                .listRowSeparator(.hidden)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Image(systemName: "person")
            }
            ToolbarItem(placement: .principal) {
                Text("Jeevan")
            }
        }
        .toolbarRole(.editor)
        Spacer()
        NewMessageContainerView()
    }
}

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView()
    }
}
