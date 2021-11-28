//
//  AuthView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 7/23/21.
//

import SwiftUI

struct AuthView: View {
    
    @State var phoneNumber: String = ""
    @State var name: String = ""
    @State var age: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backgound")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Welcome to")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top, 25)
                    Image(K.Image.whiteLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 48)
                    
                    Spacer()
                    AuthFieldView(placeholder: "Enter your Number", text: $phoneNumber)
                    AuthFieldView(placeholder: "Enter your Name", text: $name)
                    AuthFieldView(placeholder: "Enter your Age", text: $age)
                    
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color.white.opacity(1)
                                )
                                .frame(width: 150, height: 50)
                            Text("Male")
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                                .font(.title3)
                        }
                        ZStack {
                            RoundedRectangle(cornerRadius: 40)
                                .fill(Color.white.opacity(0.25)
                                )
                                .frame(width: 150, height: 50)
                            Text("Female")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .font(.title3)
                        }
                    }
                    .padding(.top)
                    
                    
                    NavigationLink(destination: HomeView().navigationBarHidden(true)) {
                        Text("Let's go!".uppercased())
                            .font(.system(.title2, design: .rounded))
                            .fontWeight(.heavy)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 12)
                            .accentColor(Color.white)
                            .background(
                                Capsule().stroke(Color.white, lineWidth: 3)
                            )
                            .padding(.top, 30)
                            .padding(.bottom, 75)
                    }
                    
                    Spacer()
                    Text("*Currently only available in the USA.")
                        .foregroundColor(.white)
                }
                .frame(width: 320)
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
            .font(.system(.title, design: .rounded))
            .foregroundColor(.white)
            .padding(.horizontal, 20)
            .padding(.vertical, 12)
            .background(
                ZStack {
                    Capsule().stroke(Color.white, lineWidth: 3)
                    RoundedRectangle(cornerRadius: 40)
                        .fill(Color.white.opacity(0.25)
                        )
                }
            )
            .padding(.top)
            .frame(width: .infinity)
            .scaledToFit()
    }
}
