//
//  VideoPlayerSwiftUIApp.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

@main
struct VideoPlayerSwiftUIApp: App {
    
    @ObservedObject var apiService = APIService()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(apiService)
        }

    }
}

