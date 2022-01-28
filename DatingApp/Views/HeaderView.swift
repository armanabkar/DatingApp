//
//  HeaderView.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var showInfoView: Bool
    @Binding var showSuggestionAlert: Bool
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                showSuggestionAlert.toggle()
            }) {
                Text(K.Information.appName)
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
            }
            .sheet(isPresented: $showInfoView) {
                InfoView()
            }
            
            Spacer()
            
            Button {
                showInfoView.toggle()
            } label: {
                Image(systemName: K.Icon.info)
                    .font(.system(size: 26, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    @State static var showInfo: Bool = false
    @State static var showSuggestionAlert: Bool = false
    
    static var previews: some View {
        ZStack {
            Color.pink
            HeaderView(showInfoView: $showInfo, showSuggestionAlert: $showSuggestionAlert)
        }
        .previewLayout(.fixed(width: 375, height: 80))
    }
}
