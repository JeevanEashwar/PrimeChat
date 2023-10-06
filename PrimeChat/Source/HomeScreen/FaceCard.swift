//
//  ChatFaceCard.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct FaceCard: View {
    
    var face: FaceModal

    var body: some View {
        HStack(spacing: 10) {
            // Person's image (placeholder image)
            ContactImageView(imageUrl: face.imageUrl)
            // Display name and short detail description
            VStack(alignment: .leading, spacing: 5) {
                Text(face.title)
                    .font(.headline)
                    .foregroundColor(Color(.accentColor))
                Text(face.subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer() // Add Spacer to push the content to the leading edge
        }
        .frame(height: 44)
        .background(Color.white) // Set the background color of the card
        .cornerRadius(10)
    }
}

struct ChatFaceCard_Previews: PreviewProvider {
    static var previews: some View {
        FaceCard(face: FaceModal(imageUrl: URL(string: "https://firebasestorage.googleapis.com:443/v0/b/primechat-9a005.appspot.com/o/statusImages%2F98AA47CB-CBBB-49CB-9B89-52A28F9DD2E4.jpg?alt=media&token=de413831-c491-4b37-905e-cfa4389cff72"), title: "Jeevan", subtitle: "Hi there!"))
    }
}
