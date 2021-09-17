//
//  SearchView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject var viewModel: SongListViewModel
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


struct TrackCell: View {
    @ObservedObject var song: TrackViewModel
    
    var body: some View {
        HStack {
            ArtworkView(image: song.artwork)
            
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

struct ArtworkView: View {
    let image: Image?
    
    var body: some View {
        ZStack {
            if image != nil {
                image
            } else {
                Color(.systemGray)
                Image(systemName: "music.note")
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
        }
        .frame(width: 50, height: 50)
        .shadow(radius: 5)
        .padding(.trailing, 5)
    }
}

struct EmptyStateView: View {
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "music.note.list")
                .font(.system(size: 85))
                .padding(.bottom)
            Text("Start searching for music...")
                .font(.title)
            Spacer()
            Spacer()
        }
        .foregroundColor(Color("brandColor"))
        .padding()
    }
}

struct SearchBar: UIViewRepresentable {
    typealias UIViewType = UISearchBar
    
    @Binding var searchTerm: String
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Search"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(searchTerm: $searchTerm)
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate {
        @Binding var searchTerm: String
        
        init(searchTerm: Binding<String>) {
            self._searchTerm = searchTerm
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchTerm = searchBar.text ?? ""
            UIApplication.shared.windows.first { $0.isKeyWindow }?.endEditing(true)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SongListViewModel())
    }
}
