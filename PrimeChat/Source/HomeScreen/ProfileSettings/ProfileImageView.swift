//
//  ProfileImageView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 05/10/23.
//

import SwiftUI

struct ProfileImageView: View {
    @State var imageUrl: URL? 
    
    var body: some View {
        if let imageUrl = imageUrl {
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .success(let image):
                    // The loaded image
                    image
                        .resizable()
                        .frame(width: 200, height: 200, alignment: .center)
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color(UIColor.accentColor), lineWidth: 2))
                        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
                case .empty, .failure:
                    PlaceholderProfileView()
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            PlaceholderProfileView()
        }
    }
}

struct PlaceholderProfileView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .frame(width: 200, height: 200, alignment: .center)
            .scaledToFit()
            .foregroundColor(.gray)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color(UIColor.accentColor), lineWidth: 2))
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 4)
    }
}

struct ProfileImageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImageView()
    }
}
