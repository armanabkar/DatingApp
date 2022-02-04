//
//  ProfileView.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        VStack(spacing: 30) {
            Image(K.Image.placeholder)
                .resizable()
                .frame(width: 225, height: 225)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white,
                                lineWidth: 5)
                )
                .shadow(radius: 3)
            
            VStack(spacing: 8) {
                Text("Kushina Uzumaki")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                Text("Hidden Leaf Village - 24")
                    .font(.title2)
                    .fontWeight(.semibold)
                Divider()
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ")
                    .foregroundColor(.black.opacity(0.8))
                    .multilineTextAlignment(.center)
                Text("Sed do eiusmd tempor incidiunt ut labre et dore magna aliqua minim veniam. ")
                    .foregroundColor(.black.opacity(0.8))
                    .multilineTextAlignment(.center)
            }
            
            Spacer()
            Button(action: {
                homeViewModel.logout()
            }) {
                Text("Log Out".uppercased())
                    .fontWeight(.bold)
                    .modifier(ButtonModifier())
            }
        }
        .padding(25)
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

