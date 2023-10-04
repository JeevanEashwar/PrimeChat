//
//  NewMessageContainerView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct NewMessageContainerView: View {
    @State private var messageText = ""

    var body: some View {
        HStack {
            TextField("Type your message", text: $messageText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                // Action for sending the message
                // Clear the TextField
                messageText = ""
            }) {
                Image(systemName: "paperplane.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
            }
            .padding(.trailing)
        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .cornerRadius(20)
        .shadow(radius: 2)
    }
}

struct NewMessageContainerView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageContainerView()
            .previewLayout(.fixed(width: 400, height: 80))
    }
}

