//
//  EvaluateJS.swift
//  SwiftTerminalUI
//
//  Created by GitSwiftDev @ GitSwift LLC on 2024/12/6.
//

import WebKit

extension WKWebView {    
    func evaluateJavascriptWithRetry(javascript: String) async {
        var maxRetry = 5
        while maxRetry > 0 {
            do {
                try await evaluateJavaScriptAsync(javascript)
                return
            } catch let error as NSError {
                if error.code == 5 {
                    return
                }
                debugPrint(error.localizedDescription)
                maxRetry -= 1
                if maxRetry > 0 {
                    try? await Task.sleep(nanoseconds: 1_000_000)
                }
            }
        }
    }

    private func evaluateJavaScriptAsync(_ javascript: String) async throws {
        return try await withCheckedThrowingContinuation { continuation in
            self.evaluateJavaScript(javascript) { _, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume()
                }
            }
        }
    }
    
    func evaluateJavascriptWithRetryReturn(javascript: String) async -> Int {
        var maxRetry = 5
        while maxRetry > 0 {
            do {
                return try await evaluateJavaScriptCGFloat(javascript)
            } catch let error as NSError {
                if error.code == 5 {
                    return 0
                }
                debugPrint(error.localizedDescription)
                maxRetry -= 1
                if maxRetry > 0 {
                    try? await Task.sleep(nanoseconds: 1_000_000)
                }
            }
        }
        return 0
    }
    
    func evaluateJavaScriptCGFloat(_ javascript: String) async throws -> Int {
        return try await withCheckedThrowingContinuation { continuation in
            self.evaluateJavaScript(javascript) { result, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else {
                    continuation.resume(returning: result as? Int ?? 0)
                }
            }
        }
    }
}
