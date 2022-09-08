//
//  GuideComponent.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct GuideComponent: View {
    
    var title: String
    var subtitle: String
    var description: String
    var icon: String
    var iconColor: Color
    
    var body: some View {
        Section {
            HStack {
                Image(systemName: icon)
                    .font(.title)
                    .foregroundColor(iconColor)
                Text(title)
                    .font(.title2)
                    .fontWeight(.heavy)
            }
            .padding(.vertical, 5)
        } header: {
            Text(subtitle)
        } footer: {
            Text(description)
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        List {
            GuideComponent(
                title: "Title",
                subtitle: "Swipe right",
                description: "This is a placeholder sentence. This is a placeholder sentence. This is a placeholder sentence.",
                icon: "heart.circle",
                iconColor: .green)
            .previewLayout(.sizeThatFits)
        }
    }
}
