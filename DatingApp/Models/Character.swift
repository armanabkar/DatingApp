//
//  Character.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct Character: Codable, Hashable {
    var id: Int
    var name: String
    var neighborhood: String
    var age: Int
    var image: String
}

extension Character {
    static func createFirstCharacter() -> Character {
        return Character(
            id: 0,
            name: "Hinata Hyuga",
            neighborhood: "Hidden Leaf Village",
            age: 16,
            image: "images/hinatahyuga.jpg"
        )
    }
    
    var imageURL: String {
        return "\(K.URL.baseURL)/\(image)"
    }
}
