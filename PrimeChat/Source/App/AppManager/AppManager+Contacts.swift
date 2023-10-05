//
//  AppManager+Contacts.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 05/10/23.
//

import Foundation
import FirebaseFirestore

/// Firebase FireStore methods - Contacts
extension AppManager {
    static var contactsRef: CollectionReference {
        dbManager.collection("ContactsCollection")
    }
    
    static var userContactsRef: CollectionReference? {
        if currentUserEmail.isEmpty { return nil }
        let ref = contactsRef.document(currentUserEmail)
        ref.setData(["userEmail": currentUserEmail], merge: true) { error in
            if let error = error {
                print("Error creating/updating document: \(error)")
            } else {
                print("Document created/updated successfully!")
            }
        }
        return ref.collection("userContactEmails")
    }
    
    static func loadContacts() async -> [Contact] {
        do {
            if let snapshot = try await userContactsRef?.getDocuments() {
                let contacts = mapSnapshotToContacts(snapshot: snapshot)
                return contacts
            }
        } catch (let error) {
            print(error.localizedDescription)
        }
        return []
    }
    
    static func addContact(contactEmail: String) {
        // Get the existing contacts array and append the new contact
        // Add a document with contactEmail in the userContacts subcollection
        userContactsRef?.document(contactEmail).setData(["contactEmail": contactEmail]) { error in
            if let error = error {
                print("Error adding user contact: \(error)")
            } else {
                print("User contact added successfully!")
            }
        }
    }
    
    static func mapSnapshotToContacts(snapshot: QuerySnapshot) -> [Contact] {
        var result: [Contact] = []
        for document in snapshot.documents {
            let dictionary = document.data()
            result.append(Contact(from: dictionary))
        }
        return result
    }
}
