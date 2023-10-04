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
    var sender: String
    var receiver: String
    
    var id: String {
        documentId ?? UUID().uuidString
    }
}


extension MessageRecord {
    var dictionary: [String: Any] {
        return [
            "id": id,
            "message": message,
            "receiver": receiver,
            "sender": sender,
            "timeStamp": timeStamp
        ]
    }
    
//    init(from data: Data) throws {
//        // TODO:
//    }
}
