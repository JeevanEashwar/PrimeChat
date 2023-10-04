//
//  ChatBubbleView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

/// A fancy imageview to use as a background to the app's screens as a theme
struct ChatBubbleView: View {
    @State var size: CGFloat
    var body: some View {
        ZStack {
            Image(systemName: "bubble.left.fill")
                .foregroundColor(Color(.accentColor))
                .font(.system(size: size))
                .offset(x: 15, y: -15)

            Image(systemName: "quote.bubble.fill")
                .foregroundColor(Color(.primaryColor))
                .font(.system(size: size))
        }.shadow(radius: 5)
    }
}

