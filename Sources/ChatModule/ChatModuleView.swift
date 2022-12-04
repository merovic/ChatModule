//
//  SwiftUIView.swift
//  
//
//  Created by PaySky106 on 04/12/2022.
//

import SwiftUI

public struct ChatModuleView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    
    public init() {}
    
    public var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

public struct ChatModuleView_Previews: PreviewProvider {
    public static var previews: some View {
        ChatModuleView()
    }
}
