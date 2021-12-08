//
//  WebService.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/26/21.
//

import Foundation

protocol API {
    func startServer() async throws
    func fetchCharacters() async throws -> [Character]
    func fetchSuggestions() async throws -> [String]
}

final class WebService: API {
    
    static let shared = WebService()
    private init() {}
    
    func startServer() async throws {
        guard let url = URL(string: K.startURL) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        let (_, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while starting server") }
    }
    
    func fetchCharacters() async throws -> [Character] {
        guard let url = URL(string: K.charactersURL) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching characters") }
        let decodedCharacters = try JSONDecoder().decode([Character].self, from: data)
        
        return decodedCharacters
    }
    
    func fetchSuggestions() async throws -> [String] {
        guard let url = URL(string: K.suggestionURL) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching suggestions") }
        let decodedSuggestions = try JSONDecoder().decode([String].self, from: data)
        
        return decodedSuggestions
    }
    
}
