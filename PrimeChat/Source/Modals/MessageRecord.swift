//
//  MessageRecord.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation

struct MessageRecord: Codable, Identifiable {
    var documentId: String?
    var timeStamp: Date
    var message: String
    var senderEmail: String
    var receiverEmail: String
    
    var id: String {
        documentId ?? UUID().uuidString
    }
}


extension MessageRecord {
    var dictionary: [String: Any] {
        return [
            "id": id,
            "message": message,
            "receiverEmail": receiverEmail,
            "senderEmail": senderEmail,
            "timeStamp": timeStamp
        ]
    }
    
    init(from dictionary: [String: Any]) {
        let timeStamp = AppManager.getDateFromFIRTimeStamp(dictionary: dictionary)
        let message: String = dictionary["message"] as? String ?? ""
        let senderEmail: String = dictionary["senderEmail"] as? String ?? ""
        let receiverEmail: String = dictionary["receiverEmail"] as? String ?? ""
        let documentId: String = dictionary["id"] as? String ?? ""
        self = MessageRecord(documentId: documentId, timeStamp: timeStamp ?? Date(), message: message, senderEmail: senderEmail, receiverEmail: receiverEmail)
    }
}
