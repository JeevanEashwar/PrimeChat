//
//  StatusListView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI
struct StatusListView: View {
    @StateObject private var vm = StatusViewModal(statuses: [])
    @State var selectedImageUrl: URL? = AppManager.photoUrl
    @State var isImagePickerPresented: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Button {
                        self.isImagePickerPresented.toggle()
                    } label: {
                        FaceCard(face:
                                    FaceModal(
                                        imageUrl: selectedImageUrl,
                                        title: "My status",
                                        subtitle: ""
                                    )
                        )
                    }.padding(20)
                }
                List {
                    ForEach(vm.statuses, id: \.self.id) { item in
                        NavigationLink(destination: StatusPreviewView(photoURL: item.photoUrl)) {
                            FaceCard(face:
                                        FaceModal(
                                            imageUrl: URL(string: item.photoUrl),
                                            title: item.senderEmail,
                                            subtitle: item.timeStamp.formattedString()
                                        )
                            )
                        }
                    }
                }
            }
            .onAppear() {
                self.vm.loadStatuses()
            }
            .navigationTitle("Status")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.isImagePickerPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .tint(Color(.primaryColor))
                    }
                    .sheet(isPresented: $isImagePickerPresented) {
                        ImagePicker(selectedImageUrl: $selectedImageUrl, imageType: .Status)
                    }
                }
            }
        }
    }
}

struct StatusListView_Previews: PreviewProvider {
    static var previews: some View {
        StatusListView()
    }
}
