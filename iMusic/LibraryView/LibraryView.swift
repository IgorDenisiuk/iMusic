//
//  LibraryView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct LibraryView: View {
    
    
    @State private var isShowingDetail: Bool = false
    @State var selectedTrack: TrackViewModel?
    @ObservedObject var viewModel: SongListViewModel
    @State var track: TrackViewModel
    private let player = AudioManager()
    @EnvironmentObject var library: Library
    @State private var showingAlert = false
    @State private var isPlaying = false
    
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
                    
                    HStack {
                        Button {
                            print("play previous")
                        } label: {
                            Image(systemName: "backward.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 15)
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Button {
                            if self.library.items.isEmpty {
                                showingAlert = true
                            } else {
                                player.playPauseTrack(previewUrl: selectedTrack?.previewUrl)
                            }
                            print("play play/pause")
                        } label: {
                            Image(systemName: "playpause.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 30)
                                .foregroundColor(.white)
                        }.alert(isPresented: $showingAlert, content: {
                            Alert(title: Text("Choose tracks in Search Bar"), dismissButton: .none)
                        })
                        
                        Spacer()
                        
                        Button {
                            print("play next")
                        } label: {
                            Image(systemName: "forward.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 35, height: 15)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color("brandColor"))
                    .cornerRadius(12)
                    .padding()
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
        LibraryView(viewModel: SongListViewModel(), track: TrackViewModel(tracks: MockData.sampleTrack))
        
    }
}
