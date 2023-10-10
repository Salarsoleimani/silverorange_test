//
//  SilverOrangeNetworkError.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2023-10-10.
//

import Foundation

// I don't know what errors can network throw for now, so I just assume that we have a message when we face 400 or 500 error
public struct SilverOrangeNetworkError: Decodable {
  public let message: String?
}
