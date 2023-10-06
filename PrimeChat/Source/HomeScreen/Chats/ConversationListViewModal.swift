//
//  ConversationListViewModal.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import SwiftUI

class ConversationListViewModal: ObservableObject {
    @State var contact: Contact
    @Published var messages: [MessageRecord] = []
    init(contact: Contact) {
        self.contact = contact
    }
    
    func loadConversations() async {
        let fetchedMessages = await AppManager.getMessages(toEmail: contact.emailId)
        if let fetchedMessages = fetchedMessages {
            DispatchQueue.main.async {
                self.messages = fetchedMessages
            }
        }
        startListeningForUpdates()
    }
    
    func startListeningForUpdates() {
        DispatchQueue.main.async {
            AppManager.startListeningToMessagesCollection(toEmail: self.contact.emailId) { messages in 
                self.messages = messages
            }
        }
    }
    
    deinit {
        AppManager.stopListeningToMessagesCollection(toEmail: contact.emailId)
    }
}
