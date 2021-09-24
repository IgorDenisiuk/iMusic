//
//  TrackDetailView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct TrackDetailView: View {
    
    @EnvironmentObject var library: LibraryViewModel
    @ObservedObject var image = ImageLoader()
    @State var player = AudioManager()
    @State var track: TrackViewModel
    @State var volumeSlider: Double
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            
            xMarkButton(isShowingDetail: $isShowingDetail)
            
            ArtworkView(image: track.artwork)
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(10)
            
            TrackNameAndTrackArtist(track: track)
            
            Spacer()
            
            VolumeSlider(player: player.self, volumeSlider: 1.0)
            
            AddToLibraryButton(track: track, isShowingDetail: $isShowingDetail)
        }
        .onAppear {
            player.playPauseTrack(previewUrl: track.previewUrl)
        }
        .frame(width: 350, height: 650)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }
}

struct TrackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailView(track: TrackViewModel(tracks: MockData.sampleTrack),
                        volumeSlider: 1,
                        isShowingDetail: .constant(true))
    }
}
