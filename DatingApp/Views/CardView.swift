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
        CachedAsyncImage(url: URL(string: character.imageURL)) { image in
            image
                .resizable()
                .overlay(cardDescription(), alignment: .bottom)
                .blur(radius: homeViewModel.isTopCard(cardView: self) ? 0 : 6)
                .aspectRatio(contentMode: .fill)
        } placeholder: {
            Color(UIColor.secondarySystemBackground)
        }
        .frame(width: UIScreen.main.bounds.width - 50)
        .cornerRadius(14)
        .shadow(radius: 2)
    }
    
    @ViewBuilder private func cardDescription() -> some View {
        VStack(alignment: .center, spacing: 5) {
            Text("\(character.firstName.uppercased()), \(character.age)")
                .foregroundColor(Color.white)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text(character.neighborhood.uppercased())
                .font(.subheadline)
                .fontWeight(.bold)
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.white.opacity(0.75))
                )
        }
        .padding(.bottom, 30)
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
