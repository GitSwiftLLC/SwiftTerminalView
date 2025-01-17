//
//  XTerminal.swift
//  SwiftTerminalUI
//
//  Created by GitSwiftDev @ GitSwift LLC on 2024/12/6.
//

import Foundation
import WebKit

#if os(macOS)
    class TransparentWebView: WKWebView {
        override var isOpaque: Bool {
            false
        }
    }
#else
    class TransparentWebView: WKWebView {}
#endif

@MainActor
protocol XTerminal {
    @discardableResult
    func setupBufferChain(callback: ((String) -> Void)?) -> Self

    @discardableResult
    func setupTitleChain(callback: ((String) -> Void)?) -> Self

    @discardableResult
    func setupBellChain(callback: (() -> Void)?) -> Self

    @discardableResult
    func setupSizeChain(callback: ((CGSize) -> Void)?) -> Self

    func write(_ str: String)
    
    func requestTerminalSize() async -> CGSize
    
    func setTerminalFontSize(with size: Int)

    func setTerminalFontFamily(with family: String)

    func setTerminalTheme(with theme: XTermTheme)
}
@MainActor
class XTerminalCore: XTerminal {
    
    let associatedWebView: TransparentWebView
    let associatedWebDelegate: XTerminalWebViewDelegate
    let associatedScriptDelegate: XTerminalWebScriptHandler

    init() {
        associatedWebDelegate = XTerminalWebViewDelegate()
        associatedScriptDelegate = XTerminalWebScriptHandler()
        let configuration = WKWebViewConfiguration()
        if #available(macOS 11.0, iOS 14.0, *) {
            configuration.defaultWebpagePreferences.allowsContentJavaScript = true
        } else {
            #if os(macOS)
                configuration.preferences.javaEnabled = true
            #endif
        }
        let contentController = WKUserContentController()
        contentController.add(associatedScriptDelegate, name: "callbackHandler")
        configuration.userContentController = contentController
        configuration.preferences.setValue(true, forKey: "allowFileAccessFromFileURLs")
        associatedWebDelegate.userContentController = contentController
        associatedWebView = TransparentWebView(
            frame: CGRect(x: 0, y: 0, width: 500, height: 500),
            configuration: configuration
        )
        associatedWebView.uiDelegate = associatedWebDelegate
        associatedWebView.navigationDelegate = associatedWebDelegate
        #if os(macOS)
            associatedWebView.setValue(false, forKey: "drawsBackground")
            if #available(macOS 12.0, *) {
                associatedWebView.underPageBackgroundColor = .clear
            }
            associatedWebView.layer?.backgroundColor = .clear
        #else
            associatedWebView.isOpaque = false
            associatedWebView.backgroundColor = UIColor.clear
            associatedWebView.scrollView.backgroundColor = UIColor.clear
            associatedWebView.scrollView.isScrollEnabled = false
        #endif

        guard let resources = Bundle
            .module
            .url(
                forResource: "index",
                withExtension: "html",
                subdirectory: "xterm"
            )
        else {
            debugPrint("failed to load bundle resources, check your build system")
            associatedWebDelegate.navigateCompleted = true
            return
        }
        let request = URLRequest(url: resources)
        associatedWebView.load(request)
    }

    @discardableResult
    func setupBufferChain(callback: ((String) -> Void)?) -> Self {
        associatedScriptDelegate.onDataChain = callback
        return self
    }

    @discardableResult
    func setupTitleChain(callback: ((String) -> Void)?) -> Self {
        associatedScriptDelegate.onTitleChain = callback
        return self
    }

    @discardableResult
    func setupBellChain(callback: (() -> Void)?) -> Self {
        associatedScriptDelegate.onBellChain = callback
        return self
    }

    @discardableResult
    func setupSizeChain(callback: ((CGSize) -> Void)?) -> Self {
        associatedScriptDelegate.onSizeChain = callback
        return self
    }

    var writeBuffer: [Data] = []
    let lock = NSLock()
    let writeLock = NSLock()

    func write(_ str: String) {
        guard str.count > 0,
              let data = str.data(using: .utf8)
        else {
            return
        }
        lock.lock()
        writeBuffer.append(data)
        lock.unlock()
        self.writeData()
    }

    func writeData() {
        guard writeLock.try() else {
            return
        }
        defer {
            writeLock.unlock()
            lock.lock()
            let recall = !writeBuffer.isEmpty
            lock.unlock()
            if recall {
                self.writeData()
            }
        }

        // wait for the webview to load
        let begin = Date()
        while true {
            if associatedWebDelegate.navigateCompleted { break }
            if Date().timeIntervalSince(begin) > 5 { break }
            usleep(1000)
        }

        lock.lock()
        let copy = writeBuffer
        writeBuffer = []
        lock.unlock()

        let writes = copy
            .map { $0.base64EncodedString() }
        scriptBridgeWrite(writes, to: associatedWebView)
    }

    func scriptBridgeWrite(_ base64Array: [String], to webView: WKWebView) {
        for write in base64Array {
            let script = "term.writeBase64('\(write)');"
            Task {
                await webView.evaluateJavascriptWithRetry(javascript: script)
            }
        }
    }

    func setTerminalFontSize(with size: Int) {
        Task {
            let script = "window.setTheme({fontSize: \(size)})"
            let fit = "window.fit()"
            await self.associatedWebView.evaluateJavascriptWithRetry(javascript: script)
            await self.associatedWebView.evaluateJavascriptWithRetry(javascript: fit)
        }
    }

    func setTerminalFontFamily(with family: String) {
        Task {
            var family = family
            if !family.contains(", monospace") {
                family += ", monospace"
            }
            let script = "window.setTheme({fontFamily: '\(family)'})"
            let fit = "window.fit()"
            await self.associatedWebView.evaluateJavascriptWithRetry(javascript: script)
            await self.associatedWebView.evaluateJavascriptWithRetry(javascript: fit)
        }
    }

    func setTerminalTheme(with theme: XTermTheme) {
        Task {
            let themejson = """
{foreground: '\(theme.foreground)',
background: '\(theme.background)00',
cursor: '\(theme.cursor)',
black: '\(theme.black)',
brightBlack: '\(theme.brightBlack)',
red: '\(theme.red)',
brightRed: '\(theme.brightRed)',
green: '\(theme.green)',
brightGreen: '\(theme.brightGreen)',
yellow: '\(theme.yellow)',
brightYellow: '\(theme.brightYellow)',
blue: '\(theme.blue)',
brightBlue: '\(theme.brightBlue)',
magenta: '\(theme.magenta)',
brightMagenta: '\(theme.brightMagenta)',
cyan: '\(theme.cyan)',
brightCyan: '\(theme.brightCyan)',
white: '\(theme.white)',
brightWhite: '\(theme.brightWhite)',
selectionBackground: '\(theme.selectionBackground)'}
"""
            let script = "window.setXTermTheme(\(themejson))"
            let fit = "window.fit()"
            await self.associatedWebView.evaluateJavascriptWithRetry(javascript: script)
            await self.associatedWebView.evaluateJavascriptWithRetry(javascript: fit)
        }
    }
    
    func requestTerminalSize() async -> CGSize {
        var col = 1
        var row = 1
        
        col = await self.associatedWebView.evaluateJavascriptWithRetryReturn(javascript: "term.cols")
        row = await self.associatedWebView.evaluateJavascriptWithRetryReturn(javascript: "term.rows")
        
        return CGSize(width: col, height: row)
    }
}