//
//  HomeViewModel.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 7/26/21.
//

import SwiftUI

final class HomeViewModel: ObservableObject {
    
    @Published var characters: [Character] = [
        Character(
            id: 0,
            name: "Kushina Uzumaki",
            neighborhood: "Hidden Leaf Village",
            age: 24,
            image: "images/kushinauzumaki.png"
        )]
    @Published var suggestions: [String] = []
    
    @Published var cardViews: [CardView] = {
        var views = [CardView]()
        views.append(CardView(character: Character(
            id: 0,
            name: "Kushina Uzumaki",
            neighborhood: "Hidden Leaf Village",
            age: 24,
            image: "images/kushinauzumaki.png"
        )))
        return views
    }()
    
    func getCharacters() {
        WebService().fetchCharacters { result in
            switch result {
                case .success(let fetchedCharacters):
                    if let fetchedCharacters = fetchedCharacters {
                        self.characters.append(contentsOf: fetchedCharacters)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func getSuggestions() {
        WebService().fetchSuggestions { result in
            switch result {
                case .success(let fetchedSuggestions):
                    if let fetchedSuggestions = fetchedSuggestions {
                        self.suggestions.append(contentsOf: fetchedSuggestions)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func generateRandomSuggestion() -> String {
        let randomInt = Int.random(in: 0..<11)
        let suggestion = suggestions[randomInt]
        return suggestion
    }
    
    func fetchAll(){
        getCharacters()
        getSuggestions()
    }
    
}
