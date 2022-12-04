//
//  ChatDetailsView.swift
//  YallaSuperApp
//
//  Created by Ps602 on 01/12/2022.
//

import SwiftUI

struct ChatDetailsView: View {
    
    @State var sendText: String = ""
    var avatarImage: String = "profile_image"
    var name: String = "Name"
    @State var showingPopup = false
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            Image("Background")
                .resizable()
                //.customIgnoreArea()
            VStack {
                ScrollView {
                    VStack {
                        ChatBubble(direction: .left) {
                            HStack(alignment: .bottom) {
                                Text("Hello!")
                                    //.font(.SFProFont(size: 14, weight: .regular))
                                Text("12:00 PM")
                                    //.font(.SFProFont(size: 9, weight: .regular))
                            }
                            .padding(.all, 20)
                            .foregroundColor(Color.white)
                            .background(Color("PrimaryColor"))
                        }
                        ChatBubble(direction: .right) {
                            HStack(alignment: .bottom) {
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse ut semper quam. Phasellus non mauris sem. Donec sed fermentum eros. Donec pretium nec turpis a semper. ")
                                    //.font(.SFProFont(size: 14, weight: .regular))
                                Text("12:10 PM")
                                    //.font(.SFProFont(size: 9, weight: .regular))
                            }
                            .padding(.all, 20)
                            .foregroundColor(Color.black)
                            //.background(Color(hex: "D6EAFF"))
                        }
                        ChatBubble(direction: .right) {
                            Image.init("fourth-onboarding")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width - 70, height: 200)
                                .aspectRatio(contentMode: .fill)
                        }
                    }
                }
                ZStack {
                    Rectangle()
                        .frame(width: .infinity, height: 50, alignment: .center)
                        //.foregroundColor(Color(hex: "F7F7F7"))
                        .cornerRadius(20)
                    HStack {
                        Button {
                            
                        } label: {
                            Image("Frame 33987")
                        }
                        TextField("Message", text: $sendText)
                        Button {
                            showingPopup = true
                        } label: {
                            Image("Frame 33850")
                        }
                        Button {
                            
                        } label: {
                            Image("Frame 33847")
                        }
                    }.padding([.leading, .trailing], 8)
                }
                .frame(width: .infinity, height: 50, alignment: .center)
                .padding([.leading, .trailing], 16)
            }
//            .popup(isPresented: $showingPopup) { // 3
//                ZStack { // 4
//                    Rectangle()
//                        .frame(width: 150, height: 200, alignment: .center)
//                        .foregroundColor(Color.white)
//                        .cornerRadius(8)
//                        .shadow(radius: 5)
//                    VStack(alignment: .trailing) {
//                        HStack {
//                            Text("Send Money")
//                                //.font(.SFProFont(size: 12, weight: .regular))
//                                .foregroundColor(Color("PrimaryColor"))
//                            Image("CTA")
//                        }
//                        HStack {
//                            Text("Collect Money")
//                                //.font(.SFProFont(size: 12, weight: .regular))
//                                .foregroundColor(Color("PrimaryColor"))
//                            Image("CTA-1")
//                        }
//                        HStack {
//                            Text("Upload Image")
//                                //.font(.SFProFont(size: 12, weight: .regular))
//                                .foregroundColor(Color("PrimaryColor"))
//                            Image("CTA-2")
//                        }
//                    }
//                }
//                .padding(.bottom, UIScreen.main.bounds.height/2.5)
//                .padding(.leading, UIScreen.main.bounds.width/3.5)
//            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: backButtonView,
                trailing:
                    Button(action: {
                        
                    }, label: {
                        Image("Frame 6510")
                    })
            )
        }.onTapGesture {
            showingPopup = false
        }
    }
    
    var backButtonView : some View {
        HStack(spacing: 16) {
            Image("arrow-left").flipsForRightToLeftLayoutDirection(true)
            HStack {
                Image(avatarImage)
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .center)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                
                Text(name)
                    //.font(.SFProFont(size: 16, weight: .medium))
                    .foregroundColor(.white)
            }
        }
        .onTapGesture(perform: {
            presentationMode.wrappedValue.dismiss()
        })
    }
}
struct ChatDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ChatDetailsView()
    }
}
