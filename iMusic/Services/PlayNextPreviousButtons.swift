//
//  PlayNextPreviousButtons.swift
//  iMusic
//
//  Created by wsa-024-23b on 20.09.21.
//

import SwiftUI

struct PlayNextPreviousButtons: View {
    
    @EnvironmentObject var library: LibraryViewModel
    @Binding var selectedTrack: TrackViewModel?
    @State private var showingAlert = false
    @State var player = AudioManager()
    
    var body: some View {
        HStack {
            Button {
                if self.library.items.isEmpty {
                    showingAlert = true
                } else {
                    print("play previous")
                }
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
                if self.library.items.isEmpty {
                    showingAlert = true
                } else {
                    print("play next")
                }
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
}

struct PlayNextPreviousButtons_Previews: PreviewProvider {
    static var previews: some View {
        PlayNextPreviousButtons(selectedTrack: .constant(TrackViewModel(tracks: MockData.sampleTrack)))
    }
}
