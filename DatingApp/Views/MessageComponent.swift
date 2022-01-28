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
                Text(generateRandomText()!)
                    .lineLimit(1)
                    .font(.callout)
                    .foregroundColor(.black.opacity(0.7))
            }
            .padding(.leading, 5)
        }
    }
    
    private func generateRandomText() -> String? {
        let texts = [
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras maximus orci",
            "eo enim. Phasellus lacinia erat lacus, ac eleifend augue ornare et. Donec",
            "Mauris sed lacus id sapien pretium pharetra. Nullam auctor suscipit lacus",
            "Suspendisse in ipsum vel orci rutrum rutrum. Quisque quis tincidunt",
            "mauris, nec ullamcorper sapien. Aenean rhoncus mattis semper. Pellentesque habitant",
            "Nam tempor urna vel dolor rhoncus, vel interdum sem congue. Integer non mi",
            "leo et ex viverra tincidunt. Class aptent taciti sociosqu ad litora torquent per",
            "Suspendisse egestas, risus ac imperdiet ullamcorper, quam erat tincidunt lorem"
        ]
        
        return texts.randomElement()
    }
}

struct MessageComponent_Previews: PreviewProvider {
    static var previews: some View {
        MessageComponent(name: "Kushina Uzumaki", image: "https://animedating-server.herokuapp.com/images/kushinauzumaki.png")
            .previewLayout(.sizeThatFits)
    }
}
