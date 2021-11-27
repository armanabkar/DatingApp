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
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderIconComponent()
                
                Spacer(minLength: 10)
                VStack {
                    Image(systemName: K.Icon.profile)
                        .resizable()
                        .frame(width: 150, height: 150)
                        .padding(.bottom, 40)
                    
                    Text("Ryuko Matoi")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.pink)
                    Text("17 - Honnōji Academy")
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

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

