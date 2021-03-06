//
//  ContentView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            SearchView(viewModel: SongListViewModel())
                .tabItem {
                    Image(systemName: "magnifyingglass.circle.fill")
                    Text("Search")
                }
            
            LibraryView(viewModel: SongListViewModel(), track: TrackViewModel(tracks: MockData.sampleTrack))
                .tabItem {
                    Image(systemName: "tv.music.note.fill")
                    Text("Library")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Account")
                }
        }
        .accentColor(Color("brandColor"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

