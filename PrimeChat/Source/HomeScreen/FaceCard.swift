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
            face.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
                .clipShape(Circle())
                .tint(Color(.accentColor))

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
        .background(Color.white) // Set the background color of the card
        .cornerRadius(10)
    }
}

struct ChatFaceCard_Previews: PreviewProvider {
    static var previews: some View {
        FaceCard(face: FaceModal(title: "Jeevan", subtitle: "Hi there!"))
    }
}
