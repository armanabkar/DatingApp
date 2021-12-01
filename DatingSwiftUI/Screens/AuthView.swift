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
                
                VStack(alignment: .center) {
                    Text("Welcome to")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Image(K.Image.whiteLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 48)
                    
                    Spacer()
                    AuthFieldView(placeholder: "Enter your Number", text: $phoneNumber)
                    AuthFieldView(placeholder: "Enter your Name", text: $name)
                        .padding(.top)
                    AuthFieldView(placeholder: "Enter your Age", text: $age)
                        .padding(.top)
                    HStack {
                        AuthPickerView(name: "Male", opacity: 1)
                        AuthPickerView(name: "Female", opacity: 0.25)
                    }
                    .padding(.top)
                    
                    
                    NavigationLink(destination: HomeView().navigationBarHidden(true)) {
                        Text("Let's go!".uppercased())
                            .modifier(ButtonModifier())
                            .padding(.top)
                    }
                    
                    Spacer()
                    Text("*Currently only available in the USA.")
                        .foregroundColor(.white)
                }
                .frame(width: 320)
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
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                ZStack {
                    RoundedRectangle(cornerRadius: 14).stroke(Color.white, lineWidth: 3)
                    RoundedRectangle(cornerRadius: 14)
                        .fill(Color.white.opacity(0.25)
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
                .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
            Text(name)
                .foregroundColor(opacity < 0.5 ? .white : .black)
                .fontWeight(.bold)
                .font(.title3)
        }
    }
}
