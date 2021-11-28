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
            LinearGradient(colors: [.pink.opacity(0.75), .white], startPoint: .bottom, endPoint: .top)
                .ignoresSafeArea(.all)
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .center, spacing: 20) {
                    Spacer(minLength: 10)
                    VStack {
                        Image(systemName: K.Icon.profile)
                            .resizable()
                            .frame(width: 200, height: 200)
                            .padding(.bottom, 30)
                        
                        Text("Ryuko Matoi")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.pink)
                        Spacer()
                        Text("Honnōji Academy")
                            .font(.title3)
                            .fontWeight(.semibold)
                    }
                    
                    Spacer(minLength: 10)
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        NavigationView<ProfileView>.popToRootView()
                    }) {
                        Text("Log Out".uppercased())
                            .modifier(ButtonModifier())
                    }
                }
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(.top, 15)
                .padding(.bottom, 25)
                .padding(.horizontal, 25)
            }
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

