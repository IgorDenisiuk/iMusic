//
//  LibraryView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct LibraryView: View {
    
    @EnvironmentObject var library: LibraryViewModel
    @State var selectedTrack: TrackViewModel?
    @State var player = AudioManager()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List {
                        ForEach(library.items) { song in
                            TrackCell(song: song)
                                .onTapGesture {
                                    selectedTrack = song
                                    player.playPauseTrack(previewUrl: selectedTrack?.previewUrl)
                                }
                        }
                        .onDelete(perform: delete)
                        .onMove(perform: move)
                    }
                    
                    PlayNextPreviousButtons(selectedTrack: $selectedTrack)
                    
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Library")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    
    func delete(indexSet: IndexSet) {
        player.stopTrack(previewUrl: selectedTrack?.previewUrl)
        library.items.remove(atOffsets: indexSet)
    }
    
    func move(indices: IndexSet, newOffset: Int) {
        library.items.move(fromOffsets: indices, toOffset: newOffset)
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
    }
}
