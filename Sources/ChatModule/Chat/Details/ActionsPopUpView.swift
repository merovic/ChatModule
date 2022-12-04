//
//  ActionsPopUpView.swift
//  YallaSuperApp
//
//  Created by Ps602 on 01/12/2022.
//

import SwiftUI

public struct Popup<PopupContent>: ViewModifier where PopupContent: View {
    
    // MARK: - Private Properties
    /// The rect of the hosting controller
    @State private var presenterContentRect: CGRect = .zero
    
    /// The rect of popup content
    @State private var sheetContentRect: CGRect = .zero
    
    /// The offset when the popup is displayed
    private var displayedOffset: CGFloat {
        -presenterContentRect.midY + screenHeight
    }
    
    /// The offset when the popup is hidden
    private var hiddenOffset: CGFloat {
        if presenterContentRect.isEmpty {
            return 1000
        }
        return screenHeight - presenterContentRect.midY + sheetContentRect.height/2 + 5
    }
    
    /// The current offset, based on the "presented" property
    private var currentOffset: CGFloat {
        return isPresented ? displayedOffset : hiddenOffset
    }
    private var screenWidth: CGFloat {
        UIScreen.main.bounds.size.width
    }
    
    private var screenHeight: CGFloat {
        UIScreen.main.bounds.size.height
    }
    
    init(isPresented: Binding<Bool>,
         view: @escaping () -> PopupContent) {
        self._isPresented = isPresented
        self.view = view
    }
    
    /// Controls if the sheet should be presented or not
    @Binding var isPresented: Bool
    
    /// The content to present
    var view: () -> PopupContent
    
    // MARK: - Content Builders
    public func body(content: Content) -> some View {
        ZStack {
            content
                .frameGetter($presenterContentRect)
        }
        .overlay(sheet())
    }
    
    func sheet() -> some View {
        ZStack {
            self.view()
                .simultaneousGesture(
                    TapGesture().onEnded {
                        dismiss()
                    })
                .frameGetter($sheetContentRect)
                .frame(width: screenWidth)
                .offset(x: 0, y: currentOffset)
                .animation(Animation.easeOut(duration: 0.3), value: currentOffset)
        }
    }
    
    private func dismiss() {
        isPresented = false
    }
}

struct FrameGetter: ViewModifier {
    
    @Binding var frame: CGRect
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy -> AnyView in
                    let rect = proxy.frame(in: .global)
                    // This avoids an infinite layout loop
                    if rect.integral != self.frame.integral {
                        DispatchQueue.main.async {
                            self.frame = rect
                        }
                    }
                    return AnyView(EmptyView())
                })
    }
}

extension View {
    public func popup<PopupContent: View>(
        isPresented: Binding<Bool>,
        view: @escaping () -> PopupContent) -> some View {
            self.modifier(
                Popup(
                    isPresented: isPresented,
                    view: view)
            )
        }
    
    func frameGetter(_ frame: Binding<CGRect>) -> some View {
        modifier(FrameGetter(frame: frame))
    }
}
