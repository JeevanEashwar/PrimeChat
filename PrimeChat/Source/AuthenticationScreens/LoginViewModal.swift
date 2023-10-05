//
//  LoginViewModal.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import Combine
import SwiftUI

/// ViewModal to handle business logic of LoginView
class LoginViewModal: ObservableObject {
    @Published var email: String = "september@gmail.com"
    @Published var password: String = "september"
    @Published var isSignUpEnabled: Bool = false
    @Published var screenAppeared: Bool = false
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        Publishers.CombineLatest($email, $password)
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] email, password in
                self?.isSignUpEnabled = email.isValidEmail() && password.hasMinimumNumberOfCharacters(6)
            })
            .store(in: &cancellables)
    }
    
    
    func login() async -> Bool {
        let status = await AppManager.login(email, password)
        if status != .LoginSuccess {
            // Show error
            return false
        }
        return true
    }
}
