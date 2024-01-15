//
//  VideoNetworkModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2023-10-10.
//

import Foundation

public struct VideoNetworkModel: Codable {
    public let id: String
    public let title: String
    public let hlsURL: String
    public let fullURL: String
    public let description: String
    public let publishedAt: Date
    public let author: AuthorNetworkModel
}
