//
//  CustomVideoPlayerControls.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-15.
//

import SwiftUI

struct CustomVideoPlayerControls: View {
    @Binding var playerControl: PlayerControl
    @Binding var isPlaying: Bool

    var body: some View {
        ZStack {
            // to disable the default play/pause buttons
            Rectangle()
                .fill(.red.opacity(0.0001))
                .frame(width: .deviceWidth, height: .deviceWidth / 2)
            
            HStack {
                previousButton
                playButton
                nextButton
            }
        }
    }
    
    var playButton: some View {
        Button(action: {
            isPlaying.toggle()
        }) {
            Image(!isPlaying ? "pause" : "play")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
        }
    }
    
    var previousButton: some View {
        Button(action: {
            playerControl = .previous
        }) {
            Image("previous")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
        }
    }
    
    var nextButton: some View {
        Button(action: {
            playerControl = .next
        }) {
            Image("next")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 32, height: 32)
        }
    }
}
