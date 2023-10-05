//
//  MessageCardView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

enum MessageAlignment {
    case sent
    case received
}

struct MessageCardView: View {
    let message: String
    let timestamp: String
    let alignment: MessageAlignment

    var body: some View {
        HStack {
            if alignment == .sent {
                Spacer()
            }
            
            VStack(alignment: alignment == .sent ? .trailing : .leading) {
                Text(message)
                    .font(.body)
                    .padding(.horizontal)
                    .foregroundColor(.white)
                    .lineLimit(nil)
                
                HStack {
                    Spacer()
                    Text(timestamp)
                        .font(.caption2)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical, 8)
            .background(Color(alignment == .sent ? UIColor.primaryColor : UIColor.accentColor))
            .cornerRadius(10)
            
            if alignment == .received {
                Spacer()
            }
        }
        .padding(alignment == .sent ? .leading : .trailing, 75)
    }
}

struct MessageCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            MessageCardView(message: "Hello, World!", timestamp: "10:30 AM", alignment: .sent)
            MessageCardView(message: "Hi there!", timestamp: "11:45 AM", alignment: .received)
        }
        .padding()
    }
}
