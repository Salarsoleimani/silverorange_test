//
//  NetworkURLFactory.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-14.
//

import Foundation

struct NetworkURLFactory {
    private static let baseURL = "http://localhost:4000/"
    
    public static func makeVideoUrl() -> URLRequest? {
        let apiStr = "videos"
        guard let u = URL(string: baseURL + apiStr) else { return nil }
        var urlReq = URLRequest(url: u)
        urlReq.httpMethod = RestMethods.get.rawValue
        addHeadersToURL(&urlReq)
        return urlReq
    }
    
    private static func addHeadersToURL(_ url: inout URLRequest, contentType: HeaderContentType = .json) {
      if contentType == .json {
        url.setValue(contentType.rawValue, forHTTPHeaderField: "Content-Type")
      }
    }
}
