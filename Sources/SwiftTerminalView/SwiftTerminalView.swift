//
//  SwiftTerminalView.swift
//  SwiftTerminalUI
//
//  Created by GitSwiftDev @ GitSwift LLC on 2024/12/6.
//

import SwiftUI

#if canImport(AppKit)
    import AppKit

    public struct SwiftTerminalView: NSViewRepresentable, XTerminal {
        public init() {}

        let correspondingView = XTerminalView()

        public func makeNSView(context _: Context) -> some NSView {
            correspondingView
        }

        public func updateNSView(_: NSViewType, context _: Context) {}

        @discardableResult
        public func setupBufferChain(callback: ((String) -> Void)?) -> Self {
            correspondingView.setupBufferChain(callback: callback)
            return self
        }

        @discardableResult
        public func setupTitleChain(callback: ((String) -> Void)?) -> Self {
            correspondingView.setupTitleChain(callback: callback)
            return self
        }

        @discardableResult
        public func setupBellChain(callback: (() -> Void)?) -> Self {
            correspondingView.setupBellChain(callback: callback)
            return self
        }

        @discardableResult
        public func setupSizeChain(callback: ((CGSize) -> Void)?) -> Self {
            correspondingView.setupSizeChain(callback: callback)
            return self
        }
        
        public func setTerminalFontSize(with size: Int) {
            correspondingView.setTerminalFontSize(with: size)
        }

        public func setTerminalFontFamily(with family: String) {
            correspondingView.setTerminalFontFamily(with: family)
        }

        public func setTerminalTheme(with theme: XTermTheme) {
            correspondingView.setTerminalTheme(with: theme)
        }
        
        public func write(_ str: String) {
            correspondingView.write(str)
        }

        public func requestTerminalSize() async -> CGSize {
            await correspondingView.requestTerminalSize()
        }
    }
#endif

#if canImport(UIKit)
    import UIKit

    public struct SwiftTerminalView: UIViewRepresentable {
        public init() {}

        let correspondingView = XTerminalView()

        public func makeUIView(context _: Context) -> some UIView {
            correspondingView
        }

        public func updateUIView(_: UIViewType, context _: Context) {}

        @discardableResult
        public func setupBufferChain(callback: ((String) -> Void)?) -> Self {
            correspondingView.setupBufferChain(callback: callback)
            return self
        }

        @discardableResult
        public func setupTitleChain(callback: ((String) -> Void)?) -> Self {
            correspondingView.setupTitleChain(callback: callback)
            return self
        }

        @discardableResult
        public func setupBellChain(callback: (() -> Void)?) -> Self {
            correspondingView.setupBellChain(callback: callback)
            return self
        }

        @discardableResult
        public func setupSizeChain(callback: ((CGSize) -> Void)?) -> Self {
            correspondingView.setupSizeChain(callback: callback)
            return self
        }
        
        public func setTerminalFontSize(with size: Int) {
            correspondingView.setTerminalFontSize(with: size)
        }

        public func setTerminalFontFamily(with family: String) {
            correspondingView.setTerminalFontFamily(with: family)
        }

        public func setTerminalTheme(with theme: XTermTheme) {
            correspondingView.setTerminalTheme(with: theme)
        }

        public func write(_ str: String) {
            correspondingView.write(str)
        }

        public func requestTerminalSize() async -> CGSize {
            await correspondingView.requestTerminalSize()
        }
    }
#endif
