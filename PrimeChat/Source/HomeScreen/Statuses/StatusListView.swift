//
//  StatusListView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct StatusListView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: Text("Status Detail View")) {
                    Text("Status Item 1")
                }
                NavigationLink(destination: Text("Status Detail View")) {
                    Text("Status Item 2")
                }
            }
            .navigationTitle("Status")
        }
    }
}

struct StatusListView_Previews: PreviewProvider {
    static var previews: some View {
        StatusListView()
    }
}
