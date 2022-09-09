//
//  AuthView.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/23/21.
//

import SwiftUI

struct AuthView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.pink, .white], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Text("Welcome to")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(K.Information.appName)
                    .font(.system(size: 42, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                
                Spacer()
                AuthFieldView(placeholder: "Enter your Name", contentType: .name,
                              text: $homeViewModel.name)
                AuthFieldView(placeholder: "Enter your Number",
                              contentType: .telephoneNumber,
                              text: $homeViewModel.phoneNumber)
                    .padding(.top)
                HStack {
                    AuthPickerView(name: "Male",
                                   opacity: 1)
                    AuthPickerView(name: "Female",
                                   opacity: 0.25)
                }
                .padding(.top)
                
                Button {
                    withAnimation(.easeOut(duration: 0.3)) {
                        homeViewModel.login()
                    }
                } label: {
                    Text("Let's go!".uppercased())
                        .fontWeight(.bold)
                        .modifier(ButtonModifier())
                        .padding(.top)
                }
                .disabled(homeViewModel.areFieldsFilled() ? false : true)
                .opacity(homeViewModel.areFieldsFilled() ? 1 : 0.5)

                Spacer()
                Text("*Currently only available in the USA.")
            }
            .frame(maxWidth: 320)
            .padding(.vertical, 20)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
            .environmentObject(HomeViewModel())
    }
}

struct AuthFieldView: View {
    
    var placeholder: String
    var contentType: UITextContentType?
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.system(size: 20, weight: .semibold, design: .default))
            .multilineTextAlignment(.center)
            .padding()
            .frame(height: 60)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 14).stroke(Color.white, lineWidth: 3)
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.white.opacity(0.5)
                        )
                }
            )
            .textContentType(contentType)
    }
}

struct AuthPickerView: View {
    
    var name: String
    var opacity: Double
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white.opacity(opacity)
                )
                .frame(height: 60)
            Text(name)
                .foregroundColor(opacity < 0.5 ? .white : .black)
                .fontWeight(.bold)
                .font(.title3)
        }
    }
}
