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
            Image(systemName: "person.circle")
                .resizable()
                .foregroundColor(.pink)
                .background(Color.pink.opacity(0.1))
                .frame(width: 190, height: 190)
                .clipShape(Circle())
                .overlay(
                    Circle()
                        .stroke(Color.white,
                                lineWidth: 5)
                )
                .shadow(radius: 3)
            
            VStack(spacing: 8) {
                Text("Lorem Ipsum")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                Text("Ipsum Lorem Village - 99")
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

