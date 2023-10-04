//
//  LoginView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var appState: AppState
    @StateObject var vm: LoginViewModal = LoginViewModal()
    
    var body: some View {
        ZStack {
            VStack {
                Form {
                    Section(
                        header: Text("Enter Login Credentials")
                            .foregroundColor(Color(.accentColor))
                    ) {
                        TextField("Email", text: $vm.email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .foregroundColor(Color(.accentColor))
                        
                        SecureField("Password (minimum 4 characters)", text: $vm.password)
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
                            let flag = await vm.login()
                            if flag {
                                self.appState.authScreen = .HomeContainer
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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
