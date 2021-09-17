//
//  EmptyStateView.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

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

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
