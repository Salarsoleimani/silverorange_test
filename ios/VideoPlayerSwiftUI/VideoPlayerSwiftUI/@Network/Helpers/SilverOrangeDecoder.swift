//
//  SilverOrangeDecoder.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2023-10-10.
//

import Foundation

class SilverOrangeDecoder: JSONDecoder {
  override func decode<T>(_ type: T.Type, from data: Data) throws -> T where T : Decodable {
    let decoder = JSONDecoder()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
    decoder.dateDecodingStrategy = .formatted(dateFormatter)
    return try decoder.decode(T.self, from: data)
  }
}
