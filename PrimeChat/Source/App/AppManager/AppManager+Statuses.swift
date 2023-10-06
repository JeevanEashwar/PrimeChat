//
//  AppManager+Statuses.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 06/10/23.
//

import Foundation
import FirebaseFirestore

extension AppManager {
    static func uploadStatusImageUrl(photoUrl: URL? = nil) {
        if let photoUrlString = photoUrl?.absoluteString {
            let status = Status(photoUrl: photoUrlString, timeStamp: Date(), senderEmail: currentUserEmail)
            sendStatus(status: status)
        }
    }
    static var statusesCollectionRef: CollectionReference {
        dbManager.collection("StatusCollection")
    }
    
    static func sendStatus(status: Status, completion: AddDocumentCompletion? = nil) {
        statusesCollectionRef.addDocument(data: status.dictionary, completion: completion)
    }
    
    static func getStatuses() async -> [Status]? {
        let contacts = await loadContacts()
        let myContactEmails = contacts.map { contact in
            contact.emailId
        }
        if myContactEmails.isEmpty {
            return nil
        }
        do {
            let snapshot = try await statusesCollectionRef
                .whereField("senderEmail", in: myContactEmails)
                .getDocuments()
            let statuses = mapSnapshotToStatus(snapshot: snapshot)
            return statuses
            
        } catch (let error) {
            print(error.localizedDescription)
        }
        return []
    }
    
    static func mapSnapshotToStatus(snapshot: QuerySnapshot) -> [Status] {
        var result: [Status] = []
        for document in snapshot.documents {
            let dictionary = document.data()
            result.append(Status(from: dictionary))
        }
        return result
    }
}
