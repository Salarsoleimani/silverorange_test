//
//  CustomVideoPlayer.swift
//  VideoPlayerSwiftUI
//
//  Created by Salar Soleimani on 2024-01-15.
//

import SwiftUI
import AVKit
import AVFoundation

struct CustomVideoPlayer: View {
    private let player: AVPlayer
    @Binding private var playerControl: PlayerControl
    @State private var isPlaying: Bool = false

    init(url: URL, playerControl: Binding<PlayerControl>) {
        self.player = AVPlayer(url: url)
        self._playerControl = playerControl
    }

    var body: some View {
        VideoPlayer(player: player)
        .overlay(
            CustomVideoPlayerControls(playerControl: $playerControl, isPlaying: $isPlaying)
        )
        .onAppear {
            isPlaying = true
        }
        .onChange(of: isPlaying) { newValue in
            if !newValue {
                player.play()
            } else {
                player.pause()
            }
        }
        .onChange(of: playerControl) { newValue in
            if newValue == .previous {
                player.seek(to: .zero)
                playerControl = .none
            }
            isPlaying = true
            player.pause()
        }
    }
}
