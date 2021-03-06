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
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        AsyncImage(url: URL(string: character.imageURL)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: UIScreen.main.bounds.height / 1.5)
                .overlay(cardDescription(),
                         alignment: .bottom)
                .blur(radius: homeViewModel.isTopCard(cardView: self) ? 0 : 6)
        } placeholder: {
            Color.white
        }
        .cornerRadius(14)
        .shadow(radius: 2)
        .frame(height: UIScreen.main.bounds.height / 1.5)
    }
    
    @ViewBuilder private func cardDescription() -> some View {
        VStack(alignment: .center, spacing: 12) {
            Text(character.name.uppercased())
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.horizontal, 18)
            
            Text("\(character.age) - \(character.neighborhood.uppercased())")
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(6)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white)
                )
        }
        .padding(.bottom, 45)
        .shadow(radius: 4)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(character: Character.createFirstCharacter())
            .environmentObject(HomeViewModel())
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
