//
//  MessagesView.swift
//  DatingApp
//
//  Created by Arman Abkar on 1/25/22.
//

import SwiftUI

struct MessagesView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                if homeViewModel.characters.count > 1 {
                    ForEach(searchResults, id: \.id) { character in
                        MessageComponent(name: character.name,
                                         image: "\(K.URL.baseURL)/\(character.image)", messageBody: homeViewModel.suggestions.randomElement() ?? "Hi! my name is \(character.name). Nice to meet you...")
                    }
                }
            }
            .searchable(text: $searchText)
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
            .environmentObject(HomeViewModel())
    }
}
