//
//  ContactImageView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 05/10/23.
//

import SwiftUI

struct ContactImageView: View {
    @State var imageUrl: URL?
    
    var body: some View {
        if let imageUrl = imageUrl {
            AsyncImage(url: imageUrl) { phase in
                switch phase {
                case .success(let image):
                    // The loaded image
                    image
                        .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 40)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(UIColor.primaryColor), lineWidth: 2))
                            .shadow(radius: 5)
                case .empty, .failure:
                    PlaceholderContactImageView()
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            PlaceholderContactImageView()
        }
    }
}

struct ContactImageView_Previews: PreviewProvider {
    static var previews: some View {
        ContactImageView(imageUrl: URL(string: "https://firebasestorage.googleapis.com:443/v0/b/primechat-9a005.appspot.com/o/statusImages%2F98AA47CB-CBBB-49CB-9B89-52A28F9DD2E4.jpg?alt=media&token=de413831-c491-4b37-905e-cfa4389cff72"))
    }
}


struct PlaceholderContactImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .tint(Color(.accentColor))
            .shadow(radius: 5)
    }
}
