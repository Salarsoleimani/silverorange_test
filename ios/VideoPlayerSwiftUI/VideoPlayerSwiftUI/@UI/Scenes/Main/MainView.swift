//
//  ContentView.swift
//  VideoPlayerSwiftUI
//
//  Created by Michael Gauthier on 2021-01-06.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var playerControl: PlayerControl = .none
    
    var body: some View {
        ZStack {
            TabView(selection: $viewModel.currentPage) {
                ForEach(Array(viewModel.videos.indices), id: \.self) { index in
                    let video = viewModel.videos[index]
                    VStack(alignment: .leading, spacing: 8) {
                        if let url = video.url {
                            CustomVideoPlayer(url: url, playerControl: $playerControl)
                                .frame(width: .deviceWidth, height: .deviceWidth / 1.77)
                        }
                        Text(video.title)
                            .font(.headline)
                            .padding(.horizontal)
                        Text(video.authorName)
                            .font(.subheadline)
                            .padding(.horizontal)
                        AttributedTextUIView(attributedText: viewModel.videos[index].description)
                            .padding()
                    }
                }
            }
            .ignoresSafeArea()
            .frame(width: .deviceWidth, height: .deviceHeight)
            
            
            
            ProgressView()
                .isHidden(!viewModel.isLoading)
        }
        .onAppear {
            Task { await viewModel.getVideos() }
        }
        .onChange(of: playerControl) { newValue in
            switch newValue {
            case .next:
                if viewModel.currentPage < viewModel.videos.count - 1 {
                    viewModel.currentPage += 1
                }
            case .previous:
                if viewModel.currentPage - 1 >= 0 {
                    viewModel.currentPage -= 1
                }
            default:
                print("returned to default")
            }
            
            playerControl = .none
        }
        
    }
}

#Preview {
    MainView()
}
