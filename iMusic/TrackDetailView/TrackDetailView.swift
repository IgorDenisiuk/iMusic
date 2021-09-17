//
//  TrackDetailView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct TrackDetailView: View {
    
    @EnvironmentObject var library: Library
    @State var player = AudioManager()
    @State var track: TrackViewModel
    @State var volumeSlider: Double
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingDetail = false
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)))
                            .opacity(0.6)
                        
                        Image(systemName: "xmark")
                            .imageScale(.small)
                            .frame(width: 44, height: 44)
                            .foregroundColor(.black)
                    }
                }
                .padding()
            }
            
            
            ArtworkView(image: track.artwork)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200, alignment: .center)
                .cornerRadius(10)
            
            VStack(spacing: 10) {
                Text(track.trackName)
                    .fontWeight(.semibold)
                    .font(.title)
                    .padding()
                
                Text(track.artistName)
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack {
                Image(systemName: "speaker.fill")
                    .foregroundColor(.secondary)
                
                Slider(value: $volumeSlider) {_ in
                    player.volume(volumeSlider: volumeSlider)
                }
                    .accentColor(Color("brandColor"))
                
                Image(systemName: "speaker.wave.3.fill")
                    .foregroundColor(.secondary)
            }
            .padding()
            .padding(.vertical, 15)
            
           Button {
                library.items.append(track)
                isShowingDetail = false
            } label: {
                Text("Add Track to Library")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color("brandColor"))
                    .cornerRadius(12)
            }
            .padding()
            .padding(.vertical, 5)
            
        }
        .onAppear {
            player.playPauseTrack(previewUrl: track.previewUrl)
        }
        .frame(width: 350, height: 650)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
    }
}


struct TrackDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrackDetailView(track: TrackViewModel(tracks: MockData.sampleTrack),
                        volumeSlider: 1,
                        isShowingDetail: .constant(true))
    }
}

