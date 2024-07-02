// The Swift Programming Language
// https://docs.swift.org/swift-book

import AppKit
import SwiftUI

public class WinDraggerNSView: NSView {
    
    var onDragStart: (() -> Void)?
    var onDragEnd: (() -> Void)?
    
    public override func mouseDown(with event: NSEvent) {
        guard let window = self.window else { return }
        window.performDrag(with: event)
        onDragStart?()
    }
    
    public override func mouseUp(with event: NSEvent) {
        onDragEnd?()
    }
}

public struct WinDraggerView: NSViewRepresentable {
    
    private let view = WinDraggerNSView()
    
    public init(){}
    
    public func makeNSView(context: Context) -> NSView {
        return view
    }
    
    public func updateNSView(_ nsView: NSView, context: Context) {}
    
    public func onDragStart(onDragStart: @escaping () -> Void)-> WinDraggerView {
        view.onDragStart = onDragStart
        return self
    }
    
    public func onDragEnd(onDragEnd: @escaping () -> Void)-> WinDraggerView {
        view.onDragEnd = onDragEnd
        return self
    }
    
}
