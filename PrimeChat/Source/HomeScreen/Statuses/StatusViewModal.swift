//
//  StatusViewModal.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 06/10/23.
//

import Foundation
import SwiftUI

class StatusViewModal: ObservableObject {
    @Published var statuses: [Status] = []
    
    init(statuses: [Status]) {
        self.statuses = statuses
    }
    
    func loadStatuses() {
        Task {
            if let statusesLoaded = await AppManager.getStatuses() {
                DispatchQueue.main.async {
                    self.statuses = statusesLoaded
                }
            }
        }
    }
}
