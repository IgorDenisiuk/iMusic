//
//  AddToLibraryButton.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

struct AddToLibraryButton: View {
    
    @EnvironmentObject var library: LibraryViewModel
    @State var track: TrackViewModel
    @Binding var isShowingDetail: Bool
    
    var body: some View {
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
}

struct AddToLibraryButton_Previews: PreviewProvider {
    static var previews: some View {
        AddToLibraryButton(track: TrackViewModel(tracks: MockData.sampleTrack), isShowingDetail: .constant(false))
    }
}
