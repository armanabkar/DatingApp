//
//  HeaderIconComponent.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct HeaderIconComponent: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Capsule()
                .frame(width: 120, height: 6)
                .foregroundColor(Color.secondary)
                .opacity(0.2)
            
            Image(K.Image.blackLogo)
                .resizable()
                .scaledToFit()
                .frame(height: 38)
        }
    }
}

struct HeaderComponent_Previews: PreviewProvider {
    static var previews: some View {
        HeaderIconComponent()
            .previewLayout(.fixed(width: 375, height: 128))
    }
}
