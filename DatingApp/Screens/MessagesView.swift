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
                ForEach(homeViewModel.searchResults, id: \.id) { character in
                    MessageComponent(name: character.name,
                                     image: character.imageURL,
                                     messageBody: homeViewModel.suggestions!.randomElement()!)
                }
            }
            .searchable(text: $homeViewModel.searchText)
            .navigationTitle("Messages")
            .navigationBarTitleTextColor(.pink)
        }
    }
}

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView()
            .environmentObject(HomeViewModel())
    }
}
