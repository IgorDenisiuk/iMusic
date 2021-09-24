//
//  TrackNameAndTrackArtist.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct TrackNameAndTrackArtist: View {
    
    @State var track: TrackViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text(track.trackName)
                .fontWeight(.semibold)
                .font(.title)
                .padding()
            
            Text(track.artistName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
        .multilineTextAlignment(.center)
    }
}

struct trackNameAndTrackArtist_Previews: PreviewProvider {
    static var previews: some View {
        TrackNameAndTrackArtist(track: TrackViewModel(tracks: MockData.sampleTrack))
    }
}
