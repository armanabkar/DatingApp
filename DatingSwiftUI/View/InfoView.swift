//
//  InfoView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 0)
                Text("Find Hot dates from your favorite anime series!")
                    .font(.title)
                    .fontWeight(.heavy)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .modifier(TitleModifier())
                
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
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
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
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(ItemOne: "Application", ItemTwo: "Anime Dating | SwiftUI")
            RowAppInfoView(ItemOne: "Developer", ItemTwo: "Arman Abkar")
            RowAppInfoView(ItemOne: "Compatibility", ItemTwo: "iPhone and iPad")
            RowAppInfoView(ItemOne: "Website", ItemTwo: "armanabkar.ir")
            RowAppInfoView(ItemOne: "Version", ItemTwo: "2.0.0")
        }
    }
}

struct RowAppInfoView: View {
    
    var ItemOne: String
    var ItemTwo: String
    
    var body: some View {
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

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Animes").foregroundColor(Color.gray)
            Text("Naruto, Attack on Titan, Kill la Kill")
                .multilineTextAlignment(.leading)
                .font(.footnote)
            Divider()
        }
    }
}
