//
//  MatchView.swift
//  DatingApp
//
//  Created by Arman Abkar on 2/8/22.
//

import SwiftUI

struct MatchView: View {
    
    var image: String
    @EnvironmentObject private var homeViewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.7).ignoresSafeArea(.all)
            VStack(spacing: 30) {
                Text("It's a match!")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .heavy))
                    .textCase(.uppercase)
                
                HStack(spacing: -50) {
                    ProfileImage(imageName: K.Icon.profile)
                        .frame(width: 150, height: 150)
                    
                    CachedAsyncImage(url: URL(string: image)) { image in
                        image
                            .resizable()
                    } placeholder: {
                        Color.gray
                            .opacity(0.75)
                    }
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.white,
                                    lineWidth: 5)
                    )
                    .shadow(radius: 3)
                }
                
                Button {
                    homeViewModel.showMatchSheet.toggle()
                } label: {
                    Image(systemName: K.Icon.dismiss)
                        .font(.system(size: 50, weight: .medium))
                        .foregroundColor(.white)
                }
            }
            .onTapGesture {
                homeViewModel.showMatchSheet.toggle()
            }
        }
    }
}

struct MatchView_Previews: PreviewProvider {
    static var previews: some View {
        MatchView(image: "https://animedating-server.herokuapp.com/images/kushinauzumaki.png")
    }
}
