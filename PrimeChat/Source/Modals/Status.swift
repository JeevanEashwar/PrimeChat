//
//  Status.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 06/10/23.
//

import Foundation

struct Status {
    var documentId: String?
    var photoUrl: String
    var timeStamp: Date
    var senderEmail: String
    
    var id: String {
        documentId ?? UUID().uuidString
    }
}


extension Status {
    var dictionary: [String: Any] {
        return [
            "id": id,
            "photoUrl": photoUrl,
            "senderEmail": senderEmail,
            "timeStamp": timeStamp
        ]
    }
    
    init(from dictionary: [String: Any]) {
        let timeStamp = AppManager.getDateFromFIRTimeStamp(dictionary: dictionary)
        let senderEmail: String = dictionary["senderEmail"] as? String ?? ""
        let photoUrl: String = dictionary["photoUrl"] as? String ?? ""
        let documentId: String = dictionary["id"] as? String ?? ""
        self = Status(documentId: documentId, photoUrl: photoUrl, timeStamp: timeStamp ?? Date(), senderEmail: senderEmail)
    }
}
