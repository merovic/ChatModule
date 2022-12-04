//
//  ChatChannelListView.swift
//  YallaSuperApp
//
//  Created by Ps602 on 01/12/2022.
//

import SwiftUI

public struct ChatChannelListView: View {
    
    @Binding
    var isViewVisible: Bool
    
    public init(isViewVisible: Binding<Bool>) {
        _isViewVisible = isViewVisible
        
        let navBarAppearance = UINavigationBar.appearance()
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navBarAppearance.barTintColor = UIColor(named: "PrimaryColor")
        navBarAppearance.backgroundColor = UIColor(named: "PrimaryColor")
        navigationAppearance.backgroundColor = UIColor(named: "PrimaryColor")
        
        navigationAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UINavigationBar.appearance().tintColor = UIColor.white
    }
    
    @State private var selection: ChatViewSelection?
    //@Environment(\.presentationMode) private var presentationMode
    @State var channels: [String] = ["Omar", "Mohamed", "Eslam", "Walid", "Amir", "Ahmad", "Ramzy"]
    @State var searchText: String = ""
    
    private enum ChatViewSelection {
        case addNew
        case chatDetails
    }
    
    public var body: some View {
        NavigationView {
            List {
                Section {
                    HStack {
                        TextField("Search", text: $searchText)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                        
                        Spacer()
                    }
                    .padding(.vertical)
                    .listRowInsets(EdgeInsets())
                    .overlay(
                        HStack {
                            Spacer()
                            Button {
                                searchText = ""
                            } label: {
                                if searchText.isEmpty {
                                    Image("search-normal")
                                } else {
                                    Image(systemName: "multiply.circle.fill")
                                }
                            }
                            .foregroundColor(searchText.isEmpty ? Color("PrimaryColor") : .secondary)
                            .padding(.trailing, 16)
                        }
                    )
                }
                .padding(.horizontal)
                .background(Color("PrimaryColor"))
                
                if !searchText.isEmpty {
                    Section {
                        Text("Chat")
                            //.font(.SFProFont(size: 16, weight: .semibold))
                            .foregroundColor(Color("PrimaryColor"))
                    }
                }
                
                Section {
                    ForEach(channels.filter { searchText.isEmpty || $0.localizedStandardContains(searchText)},
                            id: \.self) { channel in
                        VStack(spacing: 0) {
                            ChatChannelListItemView()
                            NavigationLink(destination: ChatDetailsView()) {
                                EmptyView()
                            }.frame(height: 0).opacity(0)
                        }
                    }
                }.padding(.top, 8)
            }
            .listStyle(.plain)
            .navigationBarTitle("Yalla Chat")
            .navigationBarItems(
                leading:
                    Image("arrow-left").flipsForRightToLeftLayoutDirection(true)
                    .onTapGesture(perform: {
                        //presentationMode.wrappedValue.dismiss()
                        isViewVisible = false
                    }),
                trailing:
                    NavigationLink(destination: NewChatChannelView()) {
                        Image("add")
                    })
        }
    }
}
