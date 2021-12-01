//
//  FooterView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct FooterView: View {
    
    @Binding var showSuggestionAlert: Bool
    let haptics = UINotificationFeedbackGenerator()
    
    var body: some View {
        HStack {
            Image(systemName: K.Icon.dismiss)
                .font(.system(size: 42, weight: .light))
                .foregroundColor(.red)
            
            Spacer()
            
            Button(action: {
                self.haptics.notificationOccurred(.success)
                self.showSuggestionAlert.toggle()
            }) {
                Text("Random Suggestion".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(Color.white)
                    .background(Color.pink)
                    .cornerRadius(14)
                    .background(
                        Capsule().stroke(Color.pink, lineWidth: 2)
                    )
            }
            
            Spacer()
            
            Image(systemName: K.Icon.like)
                .font(.system(size: 42, weight: .light))
                .foregroundColor(.green)
        }
        .padding()
    }
}

struct FooterView_Previews: PreviewProvider {
    @State static var showAlert: Bool = false
    
    static var previews: some View {
        FooterView(showSuggestionAlert: $showAlert)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
