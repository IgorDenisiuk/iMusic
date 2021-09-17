//
//  VolumeSlider.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct VolumeSlider: View {
    
    @StateObject var player = AudioManager()
    @State var volumeSlider: Double
    
    var body: some View {
        HStack {
            Image(systemName: "speaker.fill")
                .foregroundColor(.secondary)
            
            Slider(value: $volumeSlider) {_ in
                player.volume(volumeSlider: volumeSlider)
            }
                .accentColor(Color("brandColor"))
            
            Image(systemName: "speaker.wave.3.fill")
                .foregroundColor(.secondary)
        }
        .padding()
        .padding(.vertical, 15)
    }
}

struct VolumeSlider_Previews: PreviewProvider {
    static var previews: some View {
        VolumeSlider(volumeSlider: 1)
    }
}
