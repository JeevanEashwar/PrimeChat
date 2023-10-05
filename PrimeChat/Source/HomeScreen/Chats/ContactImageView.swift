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
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                        .tint(Color(.accentColor))
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
        ContactImageView()
    }
}


struct PlaceholderContactImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            .tint(Color(.accentColor))
    }
}
