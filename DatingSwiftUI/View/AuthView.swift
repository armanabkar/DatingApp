//
//  AuthView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 7/23/21.
//

import SwiftUI

struct AuthView: View {
    
    @State var phoneNumber: String = ""
    
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
                        .padding(.top, 50)
                    Image("logo-dating-app")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 48)
                    
                    Spacer()
                    TextField("Enter your phone", text: $phoneNumber)
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
                                    .frame(width: 300)
                            }
                        )
                        .scaledToFit()
                    
                    Button(action: {
                        
                    }) {
                        NavigationLink(destination: HomeView().navigationBarHidden(true)) {
                            Text("Let's go!".uppercased())
                                .font(.system(.title3, design: .rounded))
                                .fontWeight(.heavy)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 12)
                                .accentColor(Color.white)
                                .background(
                                    Capsule().stroke(Color.white, lineWidth: 3)
                                )
                                .padding(.top, 30)
                                .padding(.bottom, 125)
                        }
                    }
                    Spacer()
                    Text("*Currently only available in the USA.")
                        .foregroundColor(.white)
                }
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
