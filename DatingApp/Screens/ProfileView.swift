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
            ProfileImage(imageName: K.Icon.profile)
                .frame(width: 175, height: 175)
            
            VStack(spacing: 10) {
                Text(homeViewModel.profileName)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)
                Text(homeViewModel.generateRandomInformation()[0])
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.bottom)
                Text(homeViewModel.generateRandomInformation()[1])
                    .foregroundColor(.black.opacity(0.8))
                    .multilineTextAlignment(.center)
                Text(homeViewModel.generateRandomInformation()[2])
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
            .environmentObject(HomeViewModel())
    }
}

struct ProfileImage: View {
    
    var imageName: String
    
    var body: some View {
        Image(systemName: imageName)
            .resizable()
            .foregroundColor(.pink)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(Color.white,
                            lineWidth: 5)
            )
            .shadow(radius: 3)
    }
}
