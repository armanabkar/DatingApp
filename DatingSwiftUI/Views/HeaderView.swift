//
//  HeaderView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showGuideView: Bool
    @Binding var showInfoView: Bool
    
    var body: some View {
        HStack {
            Button(action: {
                self.showInfoView.toggle()
            }) {
                Image(systemName: K.Icon.info)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.gray)
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            Image(K.Image.pinkLogo)
                .resizable()
                .scaledToFit()
                .frame(height: 40)
            
            Spacer()
            Button(action: {
                self.showGuideView.toggle()
            }) {
                Image(systemName: K.Icon.profile)
                    .font(.system(size: 40, weight: .semibold))
                    .foregroundColor(.pink)
            }
            .accentColor(Color.primary)
            .sheet(isPresented: $showGuideView) {
                ProfileView()
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showGuide: Bool = false
    @State static var showInfo: Bool = false
    
    static var previews: some View {
        HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
            .previewLayout(.fixed(width: 375, height: 80))
    }
}
