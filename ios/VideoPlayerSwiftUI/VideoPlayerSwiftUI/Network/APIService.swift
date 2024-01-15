//
//  APIService.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-14.
//

import Foundation

public protocol APIServiceProtocol {
    func getVideoData() async throws -> VideoNetworkModel?
}

public class APIService: ObservableObject, APIServiceProtocol {
    private let networkManager = NetworkManager()
    
    public func getVideoData() async throws -> VideoNetworkModel? {
        guard var url = NetworkURLFactory.makeVideoUrl() else { throw APIServiceError.invalidURL }
        let resp: VideoNetworkModel? = try await networkManager.request(url: &url)
        return resp
    }
}
