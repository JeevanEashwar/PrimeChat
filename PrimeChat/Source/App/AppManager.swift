//
//  AppManager.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation

import FirebaseCore
import FirebaseAuth
import Firebase

/// A class to adapt external module methods with application methods
class AppManager {
    
    /// Initializations and configurations of external modules
    static func configure() {
        FirebaseApp.configure()
    }
}

/// Firebase authentication methods
extension AppManager {
    
    /// Logged In user information - to be used in Profile section
    static var loggedInUser: User? {
        Auth.auth().currentUser
    }
    
    static var currentUserEmail: String {
        loggedInUser?.email ?? ""
    }
    
    /// Register the user using email and password
    @discardableResult
    static func signup(_ email: String, _ password: String) async -> String {
        do {
            try await Auth.auth().createUser(withEmail: email, password: password)
        } catch(let error) {
            return error.localizedDescription
        }
        return .SignUpSuccess
    }
    
    /// Log in the user using email and password
    @discardableResult
    static func login(_ email: String, _ password: String) async -> String {
        do {
            try await Auth.auth().signIn(withEmail: email, password: password)
        } catch(let error) {
            return error.localizedDescription
        }
        return .LoginSuccess
    }
}


/// Firebase FireStore methods - Messages
typealias SendMessageCompletion = (Error?) -> Void
extension AppManager {
    static var dbManager: Firestore {
        Firestore.firestore()
    }
    
    static var messagesCollectionRef: CollectionReference {
        dbManager.collection("MessagesCollection")
    }
    
    static func sendMessage(message: MessageRecord, completion: SendMessageCompletion? = nil) {
        messagesCollectionRef.addDocument(data: message.dictionary, completion: completion)
    }
    
    static func getMessages(toEmail: String) async -> [MessageRecord]? {
        let fromEmail: String = currentUserEmail
        do {
            let snapshot = try await messagesCollectionRef
                .whereField("senderEmail", in: [fromEmail, toEmail])
                .whereField("receiverEmail", in: [fromEmail, toEmail])
                .getDocuments()
            
            let messages = mapSnapshotToMessageRecords(snapshot: snapshot)
            return messages
            
        } catch (let error) {
            print(error.localizedDescription)
        }
        return []
    }
    
    static func mapSnapshotToMessageRecords(snapshot: QuerySnapshot) -> [MessageRecord] {
        var result: [MessageRecord] = []
        for document in snapshot.documents {
            let dictionary = document.data()
            result.append(MessageRecord(from: dictionary))
        }
        return result
    }
}

/// Firebase FireStore methods - Contacts
extension AppManager {
    static var contactsRef: CollectionReference {
        dbManager.collection("ContactsCollection")
    }
    
    static var userContactsRef: CollectionReference {
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
            let snapshot = try await userContactsRef.getDocuments()
            let contacts = mapSnapshotToContacts(snapshot: snapshot)
            return contacts
            
        } catch (let error) {
            print(error.localizedDescription)
        }
        return []
    }
    
    static func addContact(contactEmail: String) {
        // Get the existing contacts array and append the new contact
        // Add a document with contactEmail in the userContacts subcollection
        userContactsRef.document(contactEmail).setData(["contactEmail": contactEmail]) { error in
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

extension AppManager {
    static func getDateFromFIRTimeStamp(dictionary: [String: Any]) -> Date? {
        if let ts = dictionary["timeStamp"] as? Timestamp {
            let timestampInSeconds = TimeInterval(ts.seconds)
            let date = Date(timeIntervalSince1970: timestampInSeconds)
            return date
        }
        return nil
    }
}
