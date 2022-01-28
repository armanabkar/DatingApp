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
        AsyncImage(url: URL(string: "\(K.URL.baseURL)/\(character.image)")) { image in
            image
                .resizable()
                .cornerRadius(14)
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
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
            
        } placeholder: {
            Color.white
                .opacity(0.5)
                .blur(radius: 5)
                .frame(height: 575)
                .cornerRadius(14)
                .frame(height: 575)
                .shadow(radius: 3)
                .padding(.horizontal)
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(character: Character.createFirstCharacter())
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
