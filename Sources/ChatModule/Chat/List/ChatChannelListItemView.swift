//
//  ChatChannelListItemView.swift
//  YallaSuperApp
//
//  Created by Ps602 on 01/12/2022.
//

import SwiftUI

struct ChatChannelListItemView: View {
    
    var avatarImage: String = "profile_image"
    var showOnlineIndicator: Bool = true
    
    var name: String = "Name"
    var lastMsg: String = "Last message"
    var unreadCount: Int = 2
    var lastMsgDate: String = "12:30 PM"
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack(alignment: .topLeading) {
                Image(avatarImage)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .shadow(radius: 5)
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                if showOnlineIndicator {
                    Circle()
                        .fill(Color.green)
                        .frame(width: 10, height: 10)
                }
            }

            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .lineLimit(1)
                        //.font(.SFProFont(size: 16, weight: .medium))
                        .foregroundColor(.primary)
                    Spacer()
                    ZStack {
                        Color("PrimaryColor")
                            .frame(width: 20, height: 20)
                            .clipShape(Circle())
                        Text("\(unreadCount)")
                            //.font(.SFProFont(size: 11, weight: .medium))
                            .foregroundColor(.white)
                    }
                }
                HStack {
                    Text(lastMsg)
                        .lineLimit(2)
                        //.font(.SFProFont(size: 14, weight: .regular))
                        .foregroundColor(.secondary)
                    Spacer()
                    Text(lastMsgDate)
                        .lineLimit(1)
                        //.font(.SFProFont(size: 12, weight: .regular))
                        .foregroundColor(.secondary)
                }
            }
        }
    }
}

struct ChatChannelListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ChatChannelListItemView()
    }
}
