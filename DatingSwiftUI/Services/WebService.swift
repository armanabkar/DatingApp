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

class WebService {
    
    private let charactersAPI = "https://animedating-server.herokuapp.com/api/v1/characters"
    private let suggestionsAPI = "https://animedating-server.herokuapp.com/api/v1/suggestions"

    func fetchCharacters(completion: @escaping (Result<[Person]?, NetworkError>) -> Void) {
        guard let url = URL(string: charactersAPI) else {
            return completion(.failure(.badURL))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let characters = try? JSONDecoder().decode([Person].self, from: data)
            DispatchQueue.main.async {
                completion(.success(characters))
            }
        }
        .resume()
    }
    
    func fetchSuggestions(completion: @escaping (Result<[String]?, NetworkError>) -> Void) {
        guard let url = URL(string: suggestionsAPI) else {
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
