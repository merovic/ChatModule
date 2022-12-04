//
//  SwiftUIView.swift
//  
//
//  Created by PaySky106 on 04/12/2022.
//

import SwiftUI

public struct ChatModuleView: View {
    
    public init() {}
    
    @State var isPresenting = false
    
    // MARK: Enviroment
    @Environment(\.presentationMode)
    private var presentationMode
    
    public var body: some View {
        NavigationView {
            VStack {
                Text("Back").onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
                Button("Navigate") {
                    isPresenting = true
                }
                NavigationLink(destination: SampleView(), isActive: $isPresenting) { EmptyView() }
            }
        }
    }
    
}

public struct ChatModuleView_Previews: PreviewProvider {
    public static var previews: some View {
        ChatModuleView()
    }
}
