//
//  AddContactView.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 04/10/23.
//

import SwiftUI

struct AddContactView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @ObservedObject var vm: AddContactViewModal
    var body: some View {
        VStack(alignment: .center) {
            TextField("Email", text: $vm.email)
                .autocapitalization(.none)
                .keyboardType(.emailAddress)
                .foregroundColor(Color(.accentColor))
                .padding(.horizontal, 20)
            
            Button {
                vm.addContact()
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Add contact")
                    .frame(width: 120, height: 44)
                    .background(Color(vm.isSaveEnabed ? UIColor.primaryColor : UIColor.secondaryColor))
                    .foregroundColor(Color(vm.isSaveEnabed ? UIColor.white : UIColor.black))
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .padding()
            }.disabled(!vm.isSaveEnabed)
            Spacer()
        }

    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        @State var contacts: [Contact] = []
        AddContactView(vm: AddContactViewModal(contacts: contacts))
    }
}
