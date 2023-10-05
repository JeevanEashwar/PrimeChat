//
//  Contact.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import SwiftUI

struct Contact {
    var emailId: String
    var image: Image? = nil
    var recentMessage: String? = nil
    var displayName: String? = nil
}

extension Contact {
    init(from dictionary: [String: Any]) {
        let emailId: String = dictionary["contactEmail"] as? String ?? ""
        self = Contact(emailId: emailId)
    }
}
