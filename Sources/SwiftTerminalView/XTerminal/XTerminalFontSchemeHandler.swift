//
//  XTerminalFontSchemeHandler.swift
//  SwiftTerminalView
//
//  Created by GitSwiftDev @ GitSwift LLC on 2026/3/2.
//

import Foundation
import WebKit

final class XTerminalFontSchemeHandler: NSObject, WKURLSchemeHandler {
    static let scheme = "swiftserverfont"

    private struct Resource {
        let fileURL: URL
        let mimeType: String
    }

    private let q = DispatchQueue(label: "swiftterminalview.font.scheme")
    private var resources: [String: Resource] = [:]
    private var familyToToken: [String: String] = [:]

    func register(family: String, fileURL: URL) -> URL {
        let token = UUID().uuidString
        let mimeType = Self.mimeType(forExtension: fileURL.pathExtension)

        q.sync {
            resources[token] = .init(fileURL: fileURL, mimeType: mimeType)
            familyToToken[family] = token
        }

        return URL(string: "\(Self.scheme)://font/\(token)")!
    }

    func url(for family: String) -> URL? {
        q.sync {
            guard let token = familyToToken[family] else { return nil }
            return URL(string: "\(Self.scheme)://font/\(token)")
        }
    }

    func webView(_: WKWebView, start task: any WKURLSchemeTask) {
        guard
            let url = task.request.url,
            url.host == "font",
            let token = url.pathComponents.last
        else {
            task.didFailWithError(NSError(domain: NSURLErrorDomain, code: NSURLErrorBadURL))
            return
        }

        let resource = q.sync { resources[token] }
        guard let resource else {
            task.didFailWithError(NSError(domain: NSURLErrorDomain, code: NSURLErrorFileDoesNotExist))
            return
        }

        do {
            let data = try Data(contentsOf: resource.fileURL, options: .mappedIfSafe)
            let response = HTTPURLResponse(
                url: url,
                statusCode: 200,
                httpVersion: "HTTP/1.1",
                headerFields: [
                    "Content-Type": resource.mimeType,
                    "Access-Control-Allow-Origin": "*",
                ]
            )!
            task.didReceive(response)
            task.didReceive(data)
            task.didFinish()
        } catch {
            task.didFailWithError(error)
        }
    }

    func webView(_: WKWebView, stop _: any WKURLSchemeTask) {}

    private static func mimeType(forExtension ext: String) -> String {
        switch ext.lowercased() {
        case "ttf", "ttc":
            return "font/ttf"
        case "otf", "otc":
            return "font/otf"
        case "woff":
            return "font/woff"
        case "woff2":
            return "font/woff2"
        default:
            return "application/octet-stream"
        }
    }
}
