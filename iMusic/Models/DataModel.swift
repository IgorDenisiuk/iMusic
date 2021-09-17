//
//  DataModel.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import Foundation

class DataModel {
    
    private var dataTask: URLSessionDataTask?
    
    func loadTracks(searchTerm: String, completion: @escaping(([Track]) -> Void)) {
        dataTask?.cancel()
        guard let url = buildUrl(forTerm: searchTerm) else {
            completion([])
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else {
                completion([])
                return
            }
            
            if let songResponse = try? JSONDecoder().decode(TrackResponse.self, from: data) {
                completion(songResponse.results)
            }
        }
        dataTask?.resume()
    }
    
    private func buildUrl(forTerm searchTerm: String) -> URL? {
        guard !searchTerm.isEmpty else { return nil }
        
        let queryItems = [
            URLQueryItem(name: "term", value: searchTerm),
            URLQueryItem(name: "limit", value: "30"),
            URLQueryItem(name: "media", value: "music")
        ]
        var components = URLComponents(string: "https://itunes.apple.com/search")
        components?.queryItems = queryItems
        
        return components?.url
    }
}

struct TrackResponse: Decodable {
    let results: [Track]
}

struct Track: Decodable {
    let trackId: Int
    let trackName: String
    let artistName: String
    let previewUrl: String?
    let artworkUrl60: String
}


struct MockData {
    static let sampleTrack = Track(trackId: 0001 ,
                                  trackName: "Test TrackName",
                                  artistName: "Test artistName",
                                  previewUrl: "preview",
                                  artworkUrl60: "preview")
    
    static var tracks = [sampleTrack, sampleTrack, sampleTrack, sampleTrack]
}
