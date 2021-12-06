//
//  ProfileView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink.opacity(0.1), .white], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 30) {
                    Image(K.Image.kushinaUzumaki)
                        .resizable()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.pink,
                                        lineWidth: 5)
                        )
                        .shadow(radius: 6)
                    
                    VStack(spacing: 5) {
                        Text("Kushina Uzumaki")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        Text("Hidden Leaf Village")
                            .font(.title2)
                            .fontWeight(.semibold)
                        Divider()
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam. ")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                    .background(Color.pink.opacity(0.25))
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                }
                .padding(.top, 50)
                
                Text("Your Messages")
                    .bold()
                    .font(.title)
                    .padding()
                ChatListView()
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
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

