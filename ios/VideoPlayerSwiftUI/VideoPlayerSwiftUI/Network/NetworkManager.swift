//
//  NetworkManager.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-14.
//

import Foundation

public class NetworkManager {
    private let jsonDecoder = SilverOrangeDecoder()
    
    func request<D: Decodable>(url: inout URLRequest) async throws -> D? {
      let (data, response) = try await URLSession.shared.data(for: url)

      guard let httpResponse = response as? HTTPURLResponse else {
        throw APIServiceError.invalidResponseType
      }
      
      if (200...299).contains(httpResponse.statusCode) {
        do {
          return try jsonDecoder.decode(D.self, from: data)
        } catch let error {
          throw APIServiceError.simpleBadRequestError("Decoding error with error: \(error)")
        }
      } else if (400...499).contains(httpResponse.statusCode) {
        let error = try jsonDecoder.decode(SilverOrangeNetworkError.self, from: data)
        throw APIServiceError.httpStatusCodeFailed(statusCode: httpResponse.statusCode, error: error)
      } else if (500...599).contains(httpResponse.statusCode) {
        throw APIServiceError.serverError
      }
      return nil
    }
}
