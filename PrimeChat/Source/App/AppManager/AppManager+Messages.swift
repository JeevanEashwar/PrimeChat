//
//  AppManager+Messages.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 05/10/23.
//

import Foundation
import FirebaseFirestore

/// Firebase FireStore methods - Messages
typealias AddDocumentCompletion = (Error?) -> Void
extension AppManager {
    static var dbManager: Firestore {
        Firestore.firestore()
    }
    
    static var messagesCollectionRef: CollectionReference {
        dbManager.collection("MessagesCollection")
    }
    
    static func sendMessage(message: MessageRecord, completion: AddDocumentCompletion? = nil) {
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
    
    static func startListeningToMessagesCollection(toEmail: String, completion: @escaping (([MessageRecord]) -> Void)) {
        let fromEmail: String = currentUserEmail
        messagesCollectionRef
            .whereField("senderEmail", in: [fromEmail, toEmail])
            .whereField("receiverEmail", in: [fromEmail, toEmail])
            .addSnapshotListener { querySnapshot, error in
            guard let snapshot = querySnapshot else { return }
            let messages = mapSnapshotToMessageRecords(snapshot: snapshot)
            completion(messages)
        }
    }
    
    static func stopListeningToMessagesCollection(toEmail: String) {
        let fromEmail: String = currentUserEmail
        messagesCollectionRef
            .whereField("senderEmail", in: [fromEmail, toEmail])
            .whereField("receiverEmail", in: [fromEmail, toEmail])
            .addSnapshotListener {_,_ in }
    }
}
