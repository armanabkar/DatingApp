//
//  MessagesView.swift
//  DatingApp
//
//  Created by Arman Abkar on 1/25/22.
//

import SwiftUI

struct MessagesView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchResults, id: \.id) { character in
                    MessageComponent(name: character.name,
                                     image: "\(K.URL.baseURL)/\(character.image)",
                                     messageBody: homeViewModel.suggestions!.randomElement()!)
                }
            }
            .searchable(text: $homeViewModel.searchText)
            .navigationTitle("Messages")
            .navigationBarTitleTextColor(.pink)
        }
    }
    
    var searchResults: [Character] {
        let characters = Array(homeViewModel.matches)
        guard !homeViewModel.searchText.isEmpty else { return characters }
        return characters.filter { $0.name.contains(homeViewModel.searchText) }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
            .environmentObject(HomeViewModel())
    }
}
