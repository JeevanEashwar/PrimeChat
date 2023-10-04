//
//  SignUpViewModal.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import Foundation
import SwiftUI
import Combine

/// ViewModal to handle business logic of SignUpView
class SignUpViewModal: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
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
    
    
    func signUp() async -> Bool {
        print("signUp clicked")
        let status = await AppManager.signup(email, password)
        print(status)
        if status != .SignUpSuccess {
            // Show error
            return false
        }
        return true
    }
}

