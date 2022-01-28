//
//  MessagesView.swift
//  DatingApp
//
//  Created by Arman Abkar on 1/25/22.
//

import SwiftUI

struct MessagesView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.id) { character in
                    MessageComponent(name: character.name,
                                     image: "\(K.URL.baseURL)/\(character.image)")
                }
            }
            .searchable(text: $searchText)
            .task {
                await homeViewModel.getCharacters()
            }
            .navigationTitle("Messages")
            .navigationBarTitleTextColor(.pink)
        }
    }
    
    var searchResults: [Character] {
        let characters = Array(homeViewModel.characters.prefix(12))
        guard !searchText.isEmpty else { return characters }
        return characters.filter { $0.name.contains(searchText) }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
    }
}
