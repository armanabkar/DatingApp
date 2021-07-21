//
//  CardView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct CardView: View, Identifiable {
    
    let id = UUID()
    var person: Person
    
    var body: some View {
        Image(person.image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .overlay(
                VStack(alignment: .center, spacing: 12) {
                    Text(person.name.uppercased())
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
                    
                    Text(person.neighborhood.uppercased())
                        .foregroundColor(Color.black)
                        .font(.footnote)
                        .fontWeight(.bold)
                        .frame(minWidth: 85)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Capsule().fill(Color.white)
                        )                }
                .frame(minWidth: 280)
                .padding(.bottom, 50)
                .shadow(radius: 1),
                alignment: .bottom
            )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(person: people[0])
            .previewLayout(.fixed(width: 375, height: 600))
    }
}
