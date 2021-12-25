//
//  AuthView.swift
//  DatingApp
//
//  Created by Arman Abkar on 7/23/21.
//

import SwiftUI

struct AuthView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors: [.pink, .purple], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Text("Welcome to")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("Anime Dating")
                        .font(.system(size: 42, weight: .heavy, design: .rounded))
                        .foregroundColor(.white)
                    
                    Spacer()
                    AuthFieldView(placeholder: "Enter your Number",
                                  text: $authViewModel.phoneNumber)
                    AuthFieldView(placeholder: "Enter your Name",
                                  text: $authViewModel.name)
                        .padding(.top)
                    AuthFieldView(placeholder: "Enter your Age",
                                  text: $authViewModel.age)
                        .padding(.top)
                    HStack {
                        AuthPickerView(name: "Male",
                                       opacity: 1)
                        AuthPickerView(name: "Female",
                                       opacity: 0.25)
                    }
                    .padding(.top)
                    
                    
                    NavigationLink(destination: HomeView().navigationBarHidden(true)) {
                        Text("Let's go!".uppercased())
                            .fontWeight(.bold)
                            .modifier(ButtonModifier())
                            .padding(.top)
                    }
                    .disabled(authViewModel.areFieldsFilled() ? false : true)
                    .opacity(authViewModel.areFieldsFilled() ? 1 : 0.5)
                    .onTapGesture {
                        authViewModel.login()
                    }
                    
                    Spacer()
                    Text("* Currently only available in the USA.")
                        .foregroundColor(.white)
                }
                .frame(maxWidth: 320)
                .padding(.vertical, 20)
            }
            .navigationBarHidden(true)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}

struct AuthFieldView: View {
    
    var placeholder: String
    @Binding var text: String
    
    var body: some View {
        TextField(placeholder, text: $text)
            .font(.title3)
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
