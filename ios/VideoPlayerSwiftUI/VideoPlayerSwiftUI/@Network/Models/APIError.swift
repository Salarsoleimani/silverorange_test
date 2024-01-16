//
//  APIServiceError.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2023-10-10.
//

import Foundation

extension APIServiceError: Identifiable {
  public var id: String { self.errorCode.formatted() }
}

public enum APIServiceError: CustomNSError, Equatable {
  public static func == (lhs: APIServiceError, rhs: APIServiceError) -> Bool {
    return lhs.id == rhs.id
  }
  
  case invalidURL
  case invalidResponseType
  case httpStatusCodeFailed(statusCode: Int, error: SilverOrangeErrorResponse?)
  case serverError
    
                                                  
  public var errorCode: Int {
    switch self {
    case .invalidURL: return 1
    case .invalidResponseType: return 2
    case let .httpStatusCodeFailed(statusCode, _): return statusCode
    case .serverError: return 500
    }
  }
  
  public var errorMessage: String {
    let text: String
    switch self {
    case .serverError:
      text = "Server Error"
    case .invalidURL:
      text = "Invalid URL"
    case .invalidResponseType:
      text = "Invalid Response Type"
    case let .httpStatusCodeFailed(statusCode, error):
      if let error = error {
          text = error.message
      } else {
        text = "Error: Status Code \(statusCode)"
      }
    }
    return text
  }
}
