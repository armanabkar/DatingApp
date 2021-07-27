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
                case .success(let characters):
                    if let characters = characters {
                        people.append(contentsOf: characters)
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
    }
    
    func getSuggestions() {
        WebService().fetchSuggestions { result in
            switch result {
                case .success(let suggestion):
                    if let suggestion = suggestion {
                        suggestions.append(contentsOf: suggestion)
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

var people: [Person] = [
    Person(
        id: 0,
        name: "Kushina Uzumaki",
        neighborhood: "Hidden Leaf Village",
        age: 24,
        image: "https://i.ibb.co/bLCTr8K/kushinauzumaki.png"
    )
]

var suggestions: [String] = []
