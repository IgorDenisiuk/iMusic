//
//  SearchView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel = TrackListViewModel()
    @State private var isShowingDetail: Bool = false
    @State private var selectedTrack: TrackViewModel?
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    
                    SearchBar(searchTerm: $viewModel.searchTerm)
                    if viewModel.tracks.isEmpty {
                        EmptyStateView()
                    } else {
                        List(viewModel.tracks) { song in
                            TrackCell(song: song)
                                .onTapGesture {
                                    selectedTrack = song
                                    isShowingDetail = true
                                }
                        }
                        .listStyle(PlainListStyle())
                    }
                }
                .navigationBarTitle("Search")
                .disabled(isShowingDetail)
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                TrackDetailView(track: selectedTrack!,
                                volumeSlider: 1,
                                isShowingDetail: $isShowingDetail)
            }
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: TrackListViewModel())
    }
}
