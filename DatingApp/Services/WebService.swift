//
//  WebService.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/26/21.
//

import Foundation

enum NetworkError: Error {
    case badURL
    case noData
    case decodingError
}

protocol API {
    func startServer() async throws -> Int
    func fetchCharacters() async throws -> [Character]
    func fetchSuggestions() async throws -> [String]
}

final class WebService: API {
    
    static let shared = WebService()
    private init() {}
    private var cache = NSCache<AnyObject, AnyObject>()

    func startServer() async throws -> Int {
        guard let url = URL(string: K.URL.startURL) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (_, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else { throw NetworkError.noData }
        return response.statusCode
    }
    
    func fetchCharacters() async throws -> [Character] {
        let cachedData: [Character]? = self.cache.object(forKey: K.URL.charactersURL as AnyObject) as? [Character]
        if let characters = cachedData { return characters }

        guard let url = URL(string: K.URL.charactersURL) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.noData }
        
        guard let decodedCharacters = try? JSONDecoder().decode([Character].self, from: data) else {
            throw NetworkError.decodingError
        }
        cache.setObject(decodedCharacters as AnyObject, forKey: K.URL.charactersURL as AnyObject)
        
        return decodedCharacters
    }
    
    func fetchSuggestions() async throws -> [String] {
        let cachedData: [String]? = self.cache.object(forKey: K.URL.suggestionURL as AnyObject) as? [String]
        if let suggestions = cachedData { return suggestions }
        
        guard let url = URL(string: K.URL.suggestionURL) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.noData }
        
        guard let decodedSuggestions = try? JSONDecoder().decode([String].self, from: data) else {
            throw NetworkError.decodingError
        }
        cache.setObject(decodedSuggestions as AnyObject, forKey: K.URL.suggestionURL as AnyObject)

        return decodedSuggestions
    }
    
}
