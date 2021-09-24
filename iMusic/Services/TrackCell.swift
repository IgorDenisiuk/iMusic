//
//  TrackCell.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct TrackCell: View {
    
    @ObservedObject var song: TrackViewModel
    
    var body: some View {
        HStack {
            ArtworkView(image: song.artwork)
                .frame(width: 60, height: 60)
                .shadow(radius: 5)
                .cornerRadius(5)
                .padding(.trailing, 5)
            
            VStack(alignment: .leading) {
                Text(song.trackName)
                Text(song.artistName)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 30, alignment: .leading)
        .padding()
    }
}

struct TrackCell_Previews: PreviewProvider {
    static var previews: some View {
        TrackCell(song: TrackViewModel(tracks: MockData.sampleTrack))
    }
}
