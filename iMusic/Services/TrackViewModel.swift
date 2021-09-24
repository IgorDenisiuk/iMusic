//
//  TrackViewModel.swift
//  iMusic
//
//  Created by wsa-024-23b on 21.09.21.
//

import Foundation
import SwiftUI

class TrackViewModel: Identifiable, ObservableObject {
    
    
    let id: Int
    let trackName: String
    let artistName: String
    let previewUrl: String?
    @Published var artwork: Image?
    
    init(tracks: Track) {
        self.id = tracks.trackId
        self.trackName = tracks.trackName
        self.artistName = tracks.artistName
        self.previewUrl = tracks.previewUrl
    }
}

