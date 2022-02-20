//
//  HeaderView.swift
//  DatingApp
//
//  Created by Arman Abkar on 4/30/21.
//

import SwiftUI

struct HeaderView: View {
    
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        HStack(alignment: .center) {
            Button(action: {
                homeViewModel.showSuggestion.toggle()
            }) {
                Text(K.Information.appName)
                    .font(.system(size: 34, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
            }
            .disabled(homeViewModel.suggestions!.isEmpty && true)
            .sheet(isPresented: $homeViewModel.showInfoView) {
                InfoView()
            }
            
            Spacer()
            
            Button {
                if homeViewModel.characters!.isEmpty {
                    homeViewModel.getData()
                } else {
                    homeViewModel.showInfoView.toggle()
                }
            } label: {
                Image(systemName: homeViewModel.characters!.isEmpty ? K.Icon.reload : K.Icon.info)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.pink
            HeaderView()
        }
        .previewLayout(.fixed(width: 375, height: 80))
        .environmentObject(HomeViewModel())
    }
}
