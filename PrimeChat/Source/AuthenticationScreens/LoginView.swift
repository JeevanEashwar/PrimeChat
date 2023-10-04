//
//  LoginView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isSignUpEnabled: Bool = false
    @State private var screenAppeared: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Section(
                        header: Text("Enter Login Credentials")
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
                        appState.authScreen = .SignUp
                    }) {
                        Text("Sign Up")
                            .frame(width: 120, height: 44)
                            .foregroundColor(Color(.primaryColor))
                            .bold()
                            .underline()
                            .padding()
                    }
                    
                    Button(action: {
                        Task {
                            let status = await AppManager.login(email, password)
                            if status != .LoginSuccess {
                                // Show error
                            } else {
                                self.email = ""
                                self.password = ""
    
                                // Login success & Move to Main screen
                            }
                        }
                    }) {
                        Text("Login")
                            .frame(width: 120, height: 44)
                            .background(Color(.accentColor))
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
            .onAppear() {
                withAnimation(Animation.linear(duration: 1)) {
                    self.screenAppeared.toggle()
                }
            }
            .padding()
            
            if screenAppeared {
                ChatBubbleView(size: 120)
                    .transition(.scale)
            }
        }
    }
    
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
