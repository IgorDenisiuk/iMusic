//
//  SearchBar.swift
//  iMusic
//
//  Created by wsa-024-23b on 17.09.21.
//

import Foundation
import SwiftUI

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
