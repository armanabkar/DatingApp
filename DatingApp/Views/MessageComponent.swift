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
            CachedAsyncImage(url: URL(string: image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } placeholder: {
                Color.gray
                    .opacity(0.2)
            }
            .frame(width: 55, height: 55)
            .clipShape(RoundedRectangle(cornerRadius: 7))
            
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
