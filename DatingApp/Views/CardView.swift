//
//  CardView.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    var character: Character
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.3)
                .blur(radius: 5)
                .frame(height: 575)
                .cornerRadius(14)
                .padding()
            ImageView(withURL: "\(K.baseURL)/\(character.image)")
                .frame(height: 575)
                .shadow(radius: 3)
                .overlay(
                    VStack(alignment: .center, spacing: 12) {
                        Text(character.name.uppercased())
                            .foregroundColor(Color.white)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .shadow(radius: 2)
                            .padding(.horizontal, 18)
                            .padding(.vertical, 4)
                            .overlay(
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(height: 1)
                                    .shadow(radius: 1),
                                alignment: .bottom
                            )
                            .multilineTextAlignment(.center)
                        
                        Text("\(character.age) - \(character.neighborhood.uppercased())")
                            .foregroundColor(Color.black)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(minWidth: 85)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                            .background(
                                Capsule().fill(Color.white)
                            )
                    }
                        .frame(minWidth: 280)
                        .padding(.bottom, 50)
                        .padding(.horizontal)
                        .shadow(radius: 2),
                    alignment: .bottom
                )
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(character: Character(
            id: 0,
            name: "Kushina Uzumaki",
            neighborhood: "Hidden Leaf Village",
            age: 24,
            image: "images/kushinauzumaki.png"
        ))
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
