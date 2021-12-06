//
//  ButtonModifier.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct ButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(RoundedRectangle(cornerRadius: 14).fill(Color.pink))
            .foregroundColor(Color.white)
    }
}
