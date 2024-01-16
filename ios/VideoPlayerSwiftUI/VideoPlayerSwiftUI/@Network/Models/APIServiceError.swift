//
//  APIServiceError.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2023-10-10.
//

import Foundation

public enum APIServiceError: CustomNSError {
    case invalidURL
    case invalidResponseType
    case httpStatusCodeFailed(statusCode: Int, error: SilverOrangeNetworkError?)
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
            if let error = error?.message {
                text = error
            } else {
                text = "Error: Status Code \(statusCode)"
            }
        }
        return text
    }
    
    static func simpleBadRequestError(_ message: String) -> APIServiceError {
      return APIServiceError.httpStatusCodeFailed(statusCode: 400, error: SilverOrangeNetworkError(message: message))
    }
}

extension APIServiceError: Equatable {
    public static func == (lhs: APIServiceError, rhs: APIServiceError) -> Bool {
        return lhs.id == rhs.id
    }
}

extension APIServiceError: Identifiable {
    public var id: String { String(self.errorCode) }
}
