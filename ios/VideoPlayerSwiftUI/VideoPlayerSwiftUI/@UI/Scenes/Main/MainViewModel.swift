//
//  MainViewModel.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-14.
//

import Foundation

@MainActor
class MainViewModel: ObservableObject {
    let apiService = APIService()
    
    @Published var isLoading = false
    @Published var videos = [VideoModel]()
    @Published var currentPage = 0
    
    @Published var error: APIServiceError? // we can show error later in the ui
    
    func getVideos() async -> VideoModel? {
        isLoading = true
        do {
            if let response = try await apiService.getVideoData() {
                videos = response.sorted {$0.publishedAt > $1.publishedAt}.map {$0.toVideoModel()}
            }
            isLoading = false
        } catch let err as APIServiceError {
            isLoading = false
            error = err
        } catch {}
        return nil
    }
}
