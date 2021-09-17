//
//  iMusicApp.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import SwiftUI

@main
struct MyMusicApp: App {

    var library = Library()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(library)
        }
    }
}
