//
//  WebServiceStub.swift
//  DatingAppTests
//
//  Created by Arman Abkar on 12/12/21.
//

import Foundation
@testable import DatingApp

final class WebServiceStub: API {
    
    static let shared = WebServiceStub()
    private init() {}
    
    func startServer() async throws {
        return
    }
    
    func fetchCharacters() async throws -> [Character] {
        return [
            Character(
                id: 1,
                name: "Historia Reiss",
                neighborhood: "Wall Sheena",
                age: 19,
                image: "images/historiareiss.png"
            ),
            Character(
                id: 2,
                name: "Itachi Uchiha",
                neighborhood: "Hidden Leaf Village",
                age: 21,
                image: "images/Itachiuchiha.png"
            ),
            Character(
                id: 3,
                name: "Winry Rockbell",
                neighborhood: "Xing",
                age: 18,
                image: "images/winryrockbell.png"
            )
        ]
    }
    
    func fetchSuggestions() async throws -> [String] {
        return [
            "Suggestion 1",
            "Suggestion 2",
            "Suggestion 3"
        ]
    }
    
}
