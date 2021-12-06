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
        HStack(alignment: .center, spacing: 20) {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(systemName: icon)
                        .font(.title)
                        .foregroundColor(iconColor)
                    Text(title.uppercased())
                        .font(.title2)
                        .fontWeight(.heavy)
                    Spacer()
                    Text(subtitle.uppercased())
                        .font(.footnote)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.pink)
                }
                Divider().padding(.bottom, 4)
                Text(description)
                    .foregroundColor(.secondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct GuideComponent_Previews: PreviewProvider {
    static var previews: some View {
        GuideComponent(
            title: "Title",
            subtitle: "Swipe right",
            description: "This is a placeholder sentence. This is a placeholder sentence. This is a placeholder sentence.",
            icon: "heart.circle",
            iconColor: .green)
            .previewLayout(.sizeThatFits)
    }
}
