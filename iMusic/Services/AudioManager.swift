//
//  AudioManager.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import Foundation
import AVKit

class AudioManager: ObservableObject {
    
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
