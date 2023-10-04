//
//  SignUpView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUpEnabled: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Section(
                        header: Text("Sign Up Information")
                            .foregroundColor(Color(.accentColor))
                    ) {
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .foregroundColor(Color(.accentColor))
                        
                        SecureField("Password (minimum 4 characters)", text: $password)
                            .foregroundColor(Color(.accentColor))
                    }
                }
                
                HStack {
                    Button(action: {
                        appState.authScreen = .Login
                    }) {
                        Text("Login")
                            .frame(width: 120, height: 44)
                            .foregroundColor(Color(.accentColor))
                            .bold()
                            .underline()
                            .padding()
                    }
                    
                    Button(action: {
                        Task {
                            let status = await AppManager.signup(email, password)
                            if status != .SignUpSuccess {
                                // Show error
                            } else {
                                // Move to login screen
                                self.email = ""
                                self.password = ""
                                appState.authScreen = .Login
                            }
                        }
                    }) {
                        Text("SignUp")
                            .frame(width: 120, height: 44)
                            .background(Color(.primaryColor))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding()
                    }
                    .disabled(!isSignUpEnabled)
                }
            }
            .onReceive([self.email, self.password].publisher) { _ in
                self.isSignUpEnabled = self.email.isValidEmail() && self.password.hasMinimumNumberOfCharacters(4)
            }
            .padding()
            
            ChatBubbleView(size: 120)
        }
    }
    
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
