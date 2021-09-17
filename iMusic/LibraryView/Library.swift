//
//  Library.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

final class Library: ObservableObject {
    
    @Published var items: [TrackViewModel] = []
}

