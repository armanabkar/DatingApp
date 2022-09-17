//
//  AppInfoView.swift
//  DatingApp
//
//  Created by Arman Abkar on 9/17/22.
//

import SwiftUI

struct AppInfoView: View {
    
    private var appVersion: String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary[K.Identifiers.CFBundleShortVersionString] as! String
        let build = dictionary[K.Identifiers.CFBundleVersion] as! String
        
        return "\(version) (\(build))"
    }
    
    var body: some View {
        RowAppInfoView(ItemOne: "Application", ItemTwo: "Dating App | SwiftUI")
        RowAppInfoView(ItemOne: "Developer", ItemTwo: "Arman Abkar")
        RowAppInfoView(ItemOne: "Website", ItemTwo: "armanabkar.ir")
        RowAppInfoView(ItemOne: "Version", ItemTwo: appVersion)
        RowAppInfoView(ItemOne: "Anime", ItemTwo: "Naruto, Naruto: Shippuden, Boruto: Naruto Next Generations, Code Geass, Attack on Titan, Kill la Kill, One Piece, Tokyo Ghoul, Persona 5, Hunter X Hunter, Demon Slayer, Violet Evergarden, Fullmetal Alchemist: Brotherhood, Death Note, Steins;Gate, Ghost in the Shell", isMultiline: true)
    }
}

struct RowAppInfoView: View {
    
    var ItemOne: String
    var ItemTwo: String
    var isMultiline = false
    
    var body: some View {
        if isMultiline {
            VStack(alignment: .leading, spacing: 10) {
                Text(ItemOne).foregroundColor(Color.gray)
                Text(ItemTwo)
            }
        } else {
            VStack {
                HStack {
                    Text(ItemOne).foregroundColor(Color.gray)
                    Spacer()
                    Text(ItemTwo)
                }
            }
        }
    }
}
