//
//  SwiftUIView.swift
//  
//
//  Created by PaySky106 on 04/12/2022.
//

import SwiftUI

public struct ChatModuleView: View {
    
    @Binding
    var isViewVisible: Bool
    
    public init(isViewVisible: Binding<Bool>) {
        _isViewVisible = isViewVisible
    }
    
    @State var isPresenting = false
    
    public var body: some View {
        NavigationView {
            VStack {
                Text("Back").onTapGesture {
                    isPresenting = false
                }
                Button("Navigate") {
                    isPresenting = true
                }
                NavigationLink(destination: SampleView(), isActive: $isPresenting) { EmptyView() }
            }
        }
    }
    
}
