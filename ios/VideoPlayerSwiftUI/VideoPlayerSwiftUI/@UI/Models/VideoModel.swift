//
//  VideoModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-14.
//

import Foundation
import MarkdownKit

struct VideoModel {
    let url: URL?
    let authorName: String
    let title: String
    let description: NSAttributedString
}

extension VideoNetworkModel {
    func toVideoModel() -> VideoModel {
        let markdownParser = MarkdownParser()
        let desc = markdownParser.parse(description)
        return VideoModel(url: URL(string: hlsURL), authorName: author.name, title: title, description: desc)
    }
}
