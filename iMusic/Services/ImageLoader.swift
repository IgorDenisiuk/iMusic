//
//  ImageLoader.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import Foundation
import SwiftUI

class ArtworkLoader: ObservableObject {
    private var dataTasks: [URLSessionDataTask] = []
    
    func loadArtwork(forSong song: Track, completion: @escaping((Image?) -> Void)) {
        guard let imageUrl = URL(string: song.artworkUrl60) else {
            completion(nil)
            return
        }
        
        let dataTask = URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            guard let data = data, let artwork = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            let image = Image(uiImage: artwork)
            completion(image)
        }
        dataTasks.append(dataTask)
        dataTask.resume()
    }
    
    func reset() {
        dataTasks.forEach { $0.cancel() }
        dataTasks.removeAll()
    }
}
