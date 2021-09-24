//
//  AudioManager.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import Foundation
import AVKit
import SwiftUI

class AudioManager: ObservableObject {
    
    @EnvironmentObject var library: LibraryViewModel
    @State var track = TrackViewModel(tracks: MockData.sampleTrack)
    let player = AVPlayer()

    func playPauseTrack(previewUrl: String?) {
        if player.timeControlStatus == .paused {
            guard let url = URL(string: previewUrl ?? "") else { return }
            let playItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playItem)
            player.play()
        } else {
            guard let url = URL(string: previewUrl ?? "") else { return }
            let playItem = AVPlayerItem(url: url)
            player.replaceCurrentItem(with: playItem)
            player.pause()
        }
    }
    
    func stopTrack(previewUrl: String?) {
        guard let url = URL(string: previewUrl ?? "") else { return }
        let playItem = AVPlayerItem(url: url)
        player.replaceCurrentItem(with: playItem)
        player.pause()
    }
    
    func volume(volumeSlider: Double) {
        player.volume = Float(volumeSlider)
    }
}
