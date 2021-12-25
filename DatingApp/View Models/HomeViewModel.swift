//
//  HomeViewModel.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/26/21.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var characters: [Character] = [Character.createFirstCharacter()]
    @Published var suggestions: [String] = []
    @Published var lastCardIndex: Int = 1
    @Published var showAlert: Bool = false
    @Published var showGuide: Bool = false
    @Published var showInfo: Bool = false
    @Published var cardRemovalTransition = AnyTransition.trailingBottom
    @Published var cardViews: [CardView] = {
        return [CardView(character: Character.createFirstCharacter())]
    }()
    @Published var offset: CGFloat = .zero
    var dragAreaThreshold: CGFloat = 65.0
    var webService: API = WebService.shared
    
    func moveCards() {
        DispatchQueue.main.async {
            self.cardViews.removeFirst()
            self.lastCardIndex += 1
            let character = self.characters[self.lastCardIndex % self.characters.count]
            let newCardView = CardView(character: character)
            self.cardViews.append(newCardView)
        }
    }
    
    func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
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
    
    private func getCharacters() {
        DispatchQueue.main.async {
            Task.init {
                do {
                    let fetchedCharacters = try await self.webService.fetchCharacters()
                    self.characters.append(contentsOf: fetchedCharacters)
                } catch {
                    print(error)
                }
            }
        }
    }
    
    private func getSuggestions() {
        DispatchQueue.main.async {
            Task.init {
                do {
                    let fetchedSuggestions = try await self.webService.fetchSuggestions()
                    self.suggestions.append(contentsOf: fetchedSuggestions)
                } catch {
                    print(error)
                }
            }
        }
    }
    
}

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
        }
    }
    
    var isPressing: Bool {
        switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
        }
    }
}
