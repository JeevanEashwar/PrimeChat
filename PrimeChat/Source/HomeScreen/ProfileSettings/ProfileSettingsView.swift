//
//  ProfileSettingsView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct ProfileSettingsView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State var displayName: String = AppManager.userDisplayName
    @State private var selectedImageUrl: URL? = AppManager.photoUrl
    @State private var isImagePickerPresented: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Button {
                    isImagePickerPresented.toggle()
                } label: {
                    ProfileImageView(imageUrl: selectedImageUrl)
                }
                .sheet(isPresented: $isImagePickerPresented) {
                    ImagePicker(selectedImageUrl: $selectedImageUrl, imageType: .DisplayPicture)
                }
                HStack {
                    TextField("Type your message", text: $displayName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.horizontal)
                    Button(action: {
                        AppManager.updateUserProfile(name: displayName)
                    }) {
                        Image(systemName: "checkmark")
                            .resizable()
                            .tint(Color(UIColor.primaryColor))
                            .frame(width: 20, height: 20)
                    }
                    .padding(.trailing)
                }
                .padding()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(20)
                .shadow(radius: 2)
                List {
                    NavigationLink(destination: Text("Profile Detail View")) {
                        Text("Chats")
                    }
                    NavigationLink(destination: Text("Profile Detail View")) {
                        Text("Contact support")
                    }
                    NavigationLink(destination: Text("Profile Detail View")) {
                        Text("Notifications")
                    }
                }
                .navigationTitle("Profile Settings")
                
                Button(action: {
                    Task {
                        let message = AppManager.logout()
                        if message == .LogOutSuccess {
                            self.appState.authScreen = .Login
                        }
                    }
                }) {
                    Text("Sign out")
                        .frame(width: 120, height: 44)
                        .background(Color(.primaryColor))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .shadow(radius: 5)
                        .padding()
                }
            }
            
        }
    }
}
struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
