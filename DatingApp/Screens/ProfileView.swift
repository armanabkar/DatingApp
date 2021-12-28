//
//  ProfileView.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1).ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                Capsule()
                    .frame(width: 120, height: 6)
                    .foregroundColor(Color.secondary)
                    .opacity(0.25)
                    .padding(.top, 15)
                    
                    VStack(spacing: 5) {
                        Image(K.Image.placeholder)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white,
                                            lineWidth: 5)
                            )
                            .shadow(radius: 3)
                            .padding(10)
                        
                        Text("Kushina Uzumaki")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        Text("Hidden Leaf Village")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Divider()
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ")
                            .foregroundColor(.black.opacity(0.8))
                            .multilineTextAlignment(.center)
                    }
                    .padding()

                Text("Your Messages")
                    .bold()
                    .font(.title)
                    .padding()
                ChatListView()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                    authViewModel.logout()
                    NavigationView<ProfileView>.popToRootView()
                }) {
                    Text("Log Out".uppercased())
                        .fontWeight(.bold)
                        .modifier(ButtonModifier())
                }
                .padding(.top, 20)
            }
            .padding(.horizontal, 25)
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

