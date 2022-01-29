//
//  MessageComponent.swift
//  DatingApp
//
//  Created by Arman Abkar on 1/26/22.
//

import SwiftUI

struct MessageComponent: View {
    
    var name: String
    var image: String
    var messageBody: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white,
                                    lineWidth: 3)
                    )
                    .shadow(radius: 1)
            } placeholder: {
                Color.gray
                    .opacity(0.2)
                    .frame(width: 55, height: 55)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white,
                                    lineWidth: 4)
                    )
            }
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .fontWeight(.bold)
                    .font(.title2)
                Text(messageBody)
                    .lineLimit(1)
                    .font(.callout)
                    .foregroundColor(.black.opacity(0.7))
            }
            .padding(.leading, 5)
        }
    }
}

struct MessageComponent_Previews: PreviewProvider {
    static var previews: some View {
        MessageComponent(name: "Kushina Uzumaki",
                         image: "https://animedating-server.herokuapp.com/images/kushinauzumaki.png",
                         messageBody: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras maximus orci")
            .previewLayout(.sizeThatFits)
    }
}
