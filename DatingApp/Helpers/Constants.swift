//
//  Constants.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/27/21.
//

import SwiftUI

struct K {
    
    struct Information {
        static let appName = "ANIME DATING"
        static let description = "Find *hot dates* from your favorite anime!"
    }
    
    struct Identifiers {
        static let CFBundleVersion = "CFBundleVersion"
        static let CFBundleShortVersionString = "CFBundleShortVersionString"
    }
    
    struct URL {
        static let baseURL = "https://animedating-server.herokuapp.com"
        static let startURL = "\(baseURL)/start"
        static let charactersURL = "\(baseURL)/api/v1/characters"
        static let suggestionURL = "\(baseURL)/api/v1/suggestions"
    }
 
    struct Icon {
        static let profile = "person.circle"
        static let matchPage = "heart"
        static let message = "message"
        static let like = "heart.circle"
        static let dismiss = "xmark.circle"
        static let info = "info.circle"
        static let reload = "goforward"
    }
    
}

