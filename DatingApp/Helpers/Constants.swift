//
//  Constants.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/27/21.
//

import SwiftUI

struct K {
    
    static let baseURL = "https://animedating-server.herokuapp.com"
    static let startURL = "\(baseURL)/start"
    static let charactersURL = "\(baseURL)/api/v1/characters"
    static let suggestionURL = "\(baseURL)/api/v1/suggestions"
    
    struct Image {
        static let placeholder = "kushinauzumaki"
    }
    
    struct Icon {
        static let profile = "person.circle"
        static let like = "heart.circle"
        static let dismiss = "xmark.circle"
        static let info = "info.circle"
    }
    
}

