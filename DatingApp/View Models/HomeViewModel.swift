//
//  HomeViewModel.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/26/21.
//

import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var characters: [Character]? = []
    @Published var suggestions: [String]? = []
    @Published var matches: Set<Character> = []
    @Published var cardViews: [CardView]
    private var cardIndex = 0
    @Published var match: Character?
    @Published var showSuggestion = false
    @Published var showMatchSheet = false
    @Published var cardRemovalTransition = AnyTransition.trailingBottom
    @Published var dragState = DragState.inactive
    let dragAreaThreshold: CGFloat = 65.0
    @Published var searchText = ""
    var webService: API = WebService.shared
    
    init() {
        self._cardViews = Published(wrappedValue: [CardView(character: Character.createFirstCharacter())])
        getData()
    }
    
    var searchResults: [Character] {
        let characters = Array(matches)
        guard !searchText.isEmpty else { return characters }
        return characters.filter { $0.name.contains(searchText) }
    }
    
    func moveCards() {
        cardViews.removeFirst()
        cardIndex += 1
        let newCardView = CardView(character: characters![cardIndex + 4])
        cardViews.append(newCardView)
    }
    
    func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0
    }
    
    func generateRandomSuggestion() -> String {
        let randomInt = Int.random(in: 0..<11)
        let suggestion = suggestions![randomInt]
        return suggestion
    }
 
    func getData() {
        Task.init {
            await startServer()
            await getCharacters()
            await getSuggestions()
        }
    }
    
    private func startServer() async {
        let _ = try? await WebService.shared.startServer()
    }
    
    private func getCharacters() async {
        do {
            let fetchedCharacters = try await webService.fetchCharacters()
            characters?.append(contentsOf: fetchedCharacters)
            for character in fetchedCharacters[0...3] {
                cardViews.append(CardView(character: character))
            }
        } catch {
            print(error)
        }
        
    }
    
    private func getSuggestions() async {
        do {
            let fetchedSuggestions = try await webService.fetchSuggestions()
            suggestions?.append(contentsOf: fetchedSuggestions)
        } catch {
            print(error)
        }
    }
    
}
