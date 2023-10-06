//
//  StatusPreviewView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 06/10/23.
//

import SwiftUI

struct StatusPreviewView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var photoURL: String
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: photoURL)) { phase in
                switch phase {
                case .success(let image):
                    // The loaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                case .empty, .failure:
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Close")
                    .frame(width: 120, height: 44)
                    .background(Color(.accentColor))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
            }
        }
        .onAppear() {
            print(photoURL)
        }
    }
}

struct StatusPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        StatusPreviewView(photoURL: "some")
    }
}
