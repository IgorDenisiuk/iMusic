//
//  ArtworkView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

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

struct ArtworkView_Previews: PreviewProvider {
    static var previews: some View {
        ArtworkView(image: Image("preview"))
    }
}
