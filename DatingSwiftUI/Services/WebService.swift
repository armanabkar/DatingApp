//
//  WebService.swift
//  DatingSwiftUI
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
    func startServer(completion: @escaping (Result<String, NetworkError>) -> Void)
    func fetchCharacters(completion: @escaping (Result<[Character]?, NetworkError>) -> Void)
    func fetchSuggestions(completion: @escaping (Result<[String]?, NetworkError>) -> Void)
}

final class WebService: API {
    
    static let shared = WebService()
    private init() {}

    func startServer(completion: @escaping (Result<String, NetworkError>) -> Void) {
        guard let url = URL(string: K.startURL) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                return completion(.failure(.noData))
            }
            
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                completion(.success("Welcome to Anime Dating"))
            }
        }
        .resume()
    }
    
    func fetchCharacters(completion: @escaping (Result<[Character]?, NetworkError>) -> Void) {
        guard let url = URL(string: K.charactersURL) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let characters = try? JSONDecoder().decode([Character].self, from: data)
            DispatchQueue.main.async {
                completion(.success(characters))
            }
        }
        .resume()
    }
    
    func fetchSuggestions(completion: @escaping (Result<[String]?, NetworkError>) -> Void) {
        guard let url = URL(string: K.suggestionURL) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let suggestions = try? JSONDecoder().decode([String].self, from: data)
            DispatchQueue.main.async {
                completion(.success(suggestions))
            }
        }
        .resume()
    }

}
