//
//  ContactListRow.swift
//  ContactsSwiftUI
//
//  Created by Bruce Wade on 2020-03-01.
//  Copyright © 2020 Warply Designed Inc. All rights reserved.
//

import SwiftUI
import Contacts

struct ContactListRow: View {
    var contact: ContactData
    @State var contactImage: Image?
    
    var body: some View {
        HStack(spacing: 16) {
            if contactImage != nil {
                contactImage!
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
            } else {
                Image("profile_image")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
            }
                
            VStack(alignment: .leading) {
                Text(contact.fullName)
                    //.font(.SFProFont(size: 16, weight: .medium))
                    .foregroundColor(.black)
                Text(contact.phoneNumber)
                    //.font(.SFProFont(size: 16, weight: .regular))
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .onAppear() {
            self.contact.fetchImageIfNeeded { (image) in
                self.contactImage = image
            }
        }
    }
}

struct ContactListRow_Previews: PreviewProvider {
    static var previews: some View {
        let contact = CNMutableContact()
        contact.givenName = "John"
        contact.familyName = "Appleseed"
        
        let homeEmail = CNLabeledValue(label:CNLabelHome, value: "john@example.com" as NSString)
        let workEmail = CNLabeledValue(label:CNLabelWork, value: "j.appleseed@icloud.com" as NSString)
        contact.emailAddresses = [homeEmail, workEmail]
        
        contact.phoneNumbers = [
            CNLabeledValue(label: CNLabelPhoneNumberiPhone, value: CNPhoneNumber(stringValue: "(408) 555-0126"))
        ]
        
        return ContactListRow(contact: ContactData(contact: contact))
    }
}
