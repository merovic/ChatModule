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
    
    public var body: some View {
        NavigationView {
            VStack {
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
