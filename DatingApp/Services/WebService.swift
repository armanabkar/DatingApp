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
    case custom(String?)
}

protocol API {
    func startServer() async throws -> Int
    func fetchCharacters() async throws -> [Character]
    func fetchSuggestions() async throws -> [String]
}

final class WebService: API {
    
    static let shared = WebService()
    private init() {}
    
    func startServer() async throws -> Int {
        guard let url = URL(string: K.URL.startURL) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (_, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse,
              response.statusCode == 200 else { throw NetworkError.noData }
        return response.statusCode
    }
    
    func fetch<T: Codable>(fromURL url: String) async throws -> T {
        guard let url = URL(string: url) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.noData }
        
        guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        return decodedData
    }
    
    func fetchCharacters() async throws -> [Character] {
        guard let url = URL(string: K.URL.charactersURL) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.noData }
        
        guard let decodedCharacters = try? JSONDecoder().decode([Character].self, from: data) else {
            throw NetworkError.decodingError
        }
        return decodedCharacters
    }
    
    func fetchSuggestions() async throws -> [String] {
        guard let url = URL(string: K.URL.suggestionURL) else { throw NetworkError.badURL }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw NetworkError.noData }
        
        guard let decodedSuggestions = try? JSONDecoder().decode([String].self, from: data) else {
            throw NetworkError.decodingError
        }
        return decodedSuggestions
    }
    
}
