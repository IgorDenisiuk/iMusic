//
//  LibraryViewModel.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

final class LibraryViewModel: ObservableObject {
    
    @Published var items: [TrackViewModel] = []
}

