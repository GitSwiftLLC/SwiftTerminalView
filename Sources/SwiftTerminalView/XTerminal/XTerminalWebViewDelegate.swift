//
//  XTerminalWebViewDelegate.swift
//  SwiftTerminalUI
//
//  Created by GitSwiftDev @ GitSwift LLC on 2024/12/6.
//

import Foundation
import WebKit

class XTerminalWebViewDelegate: NSObject, WKNavigationDelegate, WKUIDelegate {
    weak var userContentController: WKUserContentController?

    var navigateCompleted: Bool = false

    func webView(_ view: WKWebView, didFinish _: WKNavigation!) {
        debugPrint("\(self) \(#function)")
        navigateCompleted = true
        
        #if os(macOS)
            enableSearch(view: view)
        #endif
    }
    
    func enableSearch(view: WKWebView) {
        Task {
            let script = "window.manager.enableFeature(\"searchBar\")"
            await view.evaluateJavascriptWithRetry(javascript: script)
        }
    }

    deinit {
        func cleanup() {
            MainActor.assumeIsolated {
                userContentController?.removeScriptMessageHandler(forName: "callbackHandler")
            }
        }
        // webkit's bug, still holding ref after deinit
        // the buffer chain will that holds a retain to shell
        // to fool the release logic for disconnect and cleanup
        debugPrint("\(self) __deinit__")
        if Thread.isMainThread {
            cleanup()
        } else {
            DispatchQueue.main.async {
                cleanup()
            }
        }
    }
}
