//
//  AddContactViewModal.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import Combine
import SwiftUI

class AddContactViewModal: ObservableObject {
    @Published var email: String = ""
    @Published var isSaveEnabed: Bool = false
    @Published var contacts: [Contact]
    
    private var cancellables = Set<AnyCancellable>()
    
    init(contacts: [Contact]) {
        self.contacts = contacts
        $email
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] email in
                self?.isSaveEnabed = email.isValidEmail()
            })
            .store(in: &cancellables)
    }
    
    func addContact() {
        contacts.append(Contact(emailId: email))
        AppManager.addContact(contactEmail: email)
    }
    
    func loadContacts() {
        Task {
            let contactsLoaded = await AppManager.loadContacts()
            DispatchQueue.main.async {
                self.contacts = contactsLoaded
            }
        }
    }
}
