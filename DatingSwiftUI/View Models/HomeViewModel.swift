//
//  HomeViewModel.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 7/26/21.
//

import Foundation

struct HomeViewModel {
 
    func getCharacters() {
        WebService().fetchCharacters { result in
            switch result {
                case .success(let fetchedCharacters):
                    if let fetchedCharacters = fetchedCharacters {
                        characters.append(contentsOf: fetchedCharacters)
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
                        suggestions.append(contentsOf: fetchedSuggestions)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func fetchAll(){
        getCharacters()
        getSuggestions()
    }
    
}

var characters: [Character] = [
    Character(
        id: 0,
        name: "Kushina Uzumaki",
        neighborhood: "Hidden Leaf Village",
        age: 24,
        image: "images/kushinauzumaki.png"
    )
]

var suggestions: [String] = []
