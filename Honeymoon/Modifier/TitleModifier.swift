//
//  TitleModifier.swift
//  Honeymoon
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(Color.pink)
    }
}
