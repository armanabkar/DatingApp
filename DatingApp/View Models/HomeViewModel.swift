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
    @Published var cardIndex = 0
    @Published var showSuggestion = false
    @Published var showInfoView: Bool = false
    @Published var match = Character.createFirstCharacter()
    @Published var showMatchSheet = false
    @Published var cardRemovalTransition = AnyTransition.trailingBottom
    @Published var cardViews = {
        return [CardView(character: Character.createFirstCharacter())]
    }()
    @Published var dragState: DragState = DragState.inactive
    @Published var name = ""
    @Published var phoneNumber = ""
    @Published var matches: Set<Character> = []
    @Published var searchText = ""
    @AppStorage("isLogin") var isLogin = false
    @AppStorage("name") var profileName = "Lorem Ipsum"
    let dragAreaThreshold: CGFloat = 65.0
    let webService: API = WebService.shared
    
    init() {
        Task.init {
            await getSuggestions()
            await getCharacters()
        }
    }
    
    func login() {
        profileName = name
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.isLogin = true
        }
    }
    
    func logout() {
        isLogin = false
    }
    
    func areFieldsFilled() -> Bool {
        !phoneNumber.isEmpty &&
        !name.isEmpty
    }
    
    func moveCards() {
        cardViews.removeFirst()
        cardIndex += 1
        let newCardView = CardView(character: characters[cardIndex + 4])
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
    
    func generateRandomInformation() -> [String] {
        let randomAge = Int.random(in: 18...50)
        return [
            "Some Random Place - \(randomAge)",
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
            "Sed do eiusmd tempor incidiunt ut labre et dore magna aliqua minim veniam."
        ]
    }
    
    func getCharacters() async {
        do {
            let fetchedCharacters = try await webService.fetchCharacters()
            characters.append(contentsOf: fetchedCharacters)
            for character in fetchedCharacters[0...3] {
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
