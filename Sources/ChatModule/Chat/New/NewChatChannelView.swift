//
//  NewChatChannelView.swift
//  YallaSuperApp
//
//  Created by Ps602 on 01/12/2022.
//

import Contacts
import SwiftUI

struct NewChatChannelView: View {
    
    let store = CNContactStore()
    @State var contacts = [ContactData]()
    @State var fetchedContacts = [ContactData]()
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        List {
            Section {
                HStack {
                    Image("Frame 33877")
                    Button {
                        // TODO: -
                    } label: {
                        Text("Create group")
                          //.font(.SFProFont(size: 16, weight: .medium))
                            .foregroundColor(Color("PrimaryColor"))
                    }
                    
                }
                .padding(.vertical)
                .listRowInsets(EdgeInsets())
            }
            .padding(.horizontal)
            Section {
                if !contacts.isEmpty {
                    ForEach(contacts) { contact in
                        ContactListRow(contact: contact)
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationBarTitle("Yalla Chat", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Image("arrow-left").flipsForRightToLeftLayoutDirection(true)
                .onTapGesture(perform: {
                    presentationMode.wrappedValue.dismiss()
                }))
        .onAppear {
            print("Launced")
            let authorizationStatus = CNContactStore.authorizationStatus(for: .contacts)
            
            if authorizationStatus == .notDetermined {
                self.store.requestAccess(for: .contacts) {  (didAuthorize, error) in
                    if didAuthorize {
                        self.retrieveContacts()
                    }
                }
            } else if authorizationStatus == .authorized {
                self.retrieveContacts()
            }
        }
    }
    
    func retrieveContacts(with customFilter: NSPredicate? = nil) {
        let containerId = store.defaultContainerIdentifier()
        let filter = CNContact.predicateForContactsInContainer(withIdentifier: containerId)
        
        let keysToFetch = [
            CNContactGivenNameKey as CNKeyDescriptor,
            CNContactFamilyNameKey as CNKeyDescriptor,
            CNContactEmailAddressesKey as CNKeyDescriptor,
            CNContactPhoneNumbersKey as CNKeyDescriptor,
            CNContactImageDataAvailableKey as CNKeyDescriptor,
            CNContactImageDataKey as CNKeyDescriptor
        ]
        
        do {
            if let customFilter = customFilter {
                fetchedContacts.removeAll(keepingCapacity: false)
                fetchedContacts = try store.unifiedContacts(matching: customFilter, keysToFetch: keysToFetch).map { ContactData(contact: $0) }
                print(fetchedContacts)
            } else {
                contacts = try store.unifiedContacts(matching: filter, keysToFetch: keysToFetch).map { ContactData(contact: $0) }
                print(contacts)
            }
        } catch {
            print(error)
        }
    }
}

struct NewChatChannelView_Previews: PreviewProvider {
    static var previews: some View {
        NewChatChannelView()
    }
}
