//
//  InfoView.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                VStack(alignment: .center, spacing: 20) {
                    Capsule()
                        .frame(width: 120, height: 6)
                        .foregroundColor(Color.secondary)
                        .opacity(0.25)
                    
                    Text(K.Information.appName)
                        .font(.system(size: 38, weight: .heavy, design: .rounded))
                        .foregroundColor(.pink)
                }
                
                RichText(K.Information.description)
                    .font(.system(size: 22, weight: .medium, design: .rounded))
                    .textCase(.uppercase)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                
                Spacer(minLength: 0)
                
                VStack(alignment: .leading, spacing: 25) {
                    GuideComponent(
                        title: "Like",
                        subtitle: "Swipe right",
                        description: "Do you like them? Touch the screen and swipe right. If they do the same, you will be matched!",
                        icon: "heart.circle", iconColor: .green)
                    
                    GuideComponent(
                        title: "Dismiss",
                        subtitle: "Swipe left",
                        description: "You don't like them? Touch the screen and swipe left. You will no longer see them.",
                        icon: "xmark.circle", iconColor: .red)
                }
                
                Spacer(minLength: 0)
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct AppInfoView: View {
    
    private var appVersion: String {
        let dictionary = Bundle.main.infoDictionary!
        let version = dictionary[K.Identifiers.CFBundleShortVersionString] as! String
        let build = dictionary[K.Identifiers.CFBundleVersion] as! String
        
        return "\(version)(\(build))"
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(ItemOne: "Application", ItemTwo: "Dating App | SwiftUI")
            RowAppInfoView(ItemOne: "Developer", ItemTwo: "Arman Abkar")
            RowAppInfoView(ItemOne: "Compatibility", ItemTwo: "iPhone and iPad")
            RowAppInfoView(ItemOne: "Website", ItemTwo: "armanabkar.ir")
            RowAppInfoView(ItemOne: "Version", ItemTwo: appVersion)
            RowAppInfoView(ItemOne: "Anime", ItemTwo: "Naruto, Naruto: Shippuden, Boruto: Naruto Next Generations, Code Geass, Attack on Titan, Kill la Kill, One Piece, Tokyo Ghoul, Persona 5, Hunter X Hunter, Demon Slayer, Violet Evergarden, Fullmetal Alchemist: Brotherhood, Death Note, Steins;Gate, Ghost in the Shell", isMultiline: true)
        }
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
                Divider()
            }
        } else {
            VStack {
                HStack {
                    Text(ItemOne).foregroundColor(Color.gray)
                    Spacer()
                    Text(ItemTwo)
                }
                Divider()
            }
        }
    }
}
