//
//  SwiftUIView.swift
//  
//
//  Created by PaySky106 on 04/12/2022.
//

import SwiftUI

public struct ChatModuleView: View {
    
    public init() {}
    
    @Environment(\.presentationMode) public var presentationMode: Binding<PresentationMode>
    
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
