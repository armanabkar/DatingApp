//
//  TabsView.swift
//  DatingApp
//
//  Created by Arman Abkar on 1/26/22.
//

import SwiftUI

struct TabsView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Home")
                }
            
            MessagesView()
                .tabItem {
                    Image(systemName: "message")
                    Text("Messages")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
                }
        }
        .overlay {
            if homeViewModel.showMatchSheet {
                MatchView(image: "\(K.URL.baseURL)/\(homeViewModel.match.image)")
            }
        }
        .accentColor(.pink)
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
            .previewDevice("iPhone 13 Pro Max")
            .environmentObject(HomeViewModel())
    }
}

