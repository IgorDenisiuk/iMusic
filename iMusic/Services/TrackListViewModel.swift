//
//  TrackListViewModel.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//


import Combine
import Foundation
import SwiftUI

class SongListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published var tracks: [TrackViewModel] = []
    @Published var isLoading = false
    
    private let dataModel: DataModel = DataModel()
    private let artworkLoader: ArtworkLoader = ArtworkLoader()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        $searchTerm
            .sink(receiveValue: loadSongs(searchTerm:))
            .store(in: &disposables)
    }
    
    private func loadSongs(searchTerm: String) {
        tracks.removeAll()
        artworkLoader.reset()
        
        dataModel.loadTracks(searchTerm: searchTerm) { songs in
            songs.forEach { self.appendSong(song: $0) }
        }
    }
    
    private func appendSong(song: Track) {
        let trackViewModel = TrackViewModel(tracks: song)
        DispatchQueue.main.async {
            self.tracks.append(trackViewModel)
        }
        
        artworkLoader.loadArtwork(forSong: song) { image in
            DispatchQueue.main.async {
                trackViewModel.artwork = image
            }
        }
    }
}

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

