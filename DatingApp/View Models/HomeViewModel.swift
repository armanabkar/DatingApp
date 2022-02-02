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
    @Published var dragState: DragState = DragState.inactive
    @AppStorage("isLogin") var isLogin = false
    @Published var phoneNumber: String = ""
    @Published var name: String = ""
    @Published var age: String = ""
    var dragAreaThreshold: CGFloat = 65.0
    var webService: API = WebService.shared
    
    init() {
        Task.init {
            await getSuggestions()
            await getCharacters()
        }
    }
    
    func login() {
        isLogin = true
    }
    
    func logout() {
        isLogin = false
    }
    
    func areFieldsFilled() -> Bool {
        !phoneNumber.isEmpty &&
        !name.isEmpty &&
        !age.isEmpty ? true : false
    }
    
    func moveCards() {
        cardViews.removeFirst()
        lastCardIndex += 1
        let newCardView = CardView(character: characters[lastCardIndex + 2])
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
        let suggestion = suggestions[randomInt]
        return suggestion
    }
    
    func getCharacters() async {
        do {
            let fetchedCharacters = try await webService.fetchCharacters()
            characters.append(contentsOf: fetchedCharacters)
            for character in characters[lastCardIndex...3] {
                cardViews.append(CardView(character: character))
            }
        } catch {
            print(error)
        }
        
    }
    
    func getSuggestions() async {
        do {
            let fetchedSuggestions = try await webService.fetchSuggestions()
            suggestions.append(contentsOf: fetchedSuggestions)
        } catch {
            print(error)
        }
        
    }
    
}
