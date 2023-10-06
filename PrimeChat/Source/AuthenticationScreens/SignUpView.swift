//
//  SignUpView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

/// - Sign Up: Register using email and password
struct SignUpView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var vm: SignUpViewModal = SignUpViewModal()
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Section(
                        header: Text("Sign Up Information")
                            .foregroundColor(Color(.accentColor))
                    ) {
                        TextField("Email", text: $vm.email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .foregroundColor(Color(.accentColor))
                        
                        SecureField("Password (minimum 6 characters)", text: $vm.password)
                            .foregroundColor(Color(.accentColor))
                    }
                }
                
                HStack {
                    Button(action: {
                        self.appState.authScreen = .Login
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
                            let flag = await vm.signUp()
                            if flag {
                                self.appState.authScreen = .Login
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
                    .disabled(!vm.isSignUpEnabled)
                }
            }
            .onAppear() {
                withAnimation(Animation.linear(duration: 1)) {
                    self.vm.screenAppeared.toggle()
                }
            }
            .padding()
            
            if vm.screenAppeared {
                ChatBubbleView(size: 120)
                    .transition(.scale)
            }
        }
    }
    
}


struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
