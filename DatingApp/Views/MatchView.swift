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
            Color.black.opacity(0.5).ignoresSafeArea(.all)
            VStack(spacing: 10) {
                Text("It's a match!")
                    .foregroundColor(.white)
                    .font(.system(size: 36, weight: .heavy))
                    .textCase(.uppercase)
                
                HStack(spacing: -50) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .foregroundColor(.pink)
                        .background(Color.pink.opacity(0.1))
                        .frame(width: 150, height: 150)
                        .clipShape(Circle())
                        .overlay(
                            Circle()
                                .stroke(Color.white,
                                        lineWidth: 5)
                        )
                        .shadow(radius: 3)
                    AsyncImage(url: URL(string: image)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.pink)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white,
                                            lineWidth: 5)
                            )
                            .shadow(radius: 3)
                    } placeholder: {
                        Color.gray
                            .opacity(0.75)
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(
                                Circle()
                                    .stroke(Color.white,
                                            lineWidth: 5)
                            )
                            .shadow(radius: 3)
                    }
                }
                .frame(maxHeight: 200)
                
                Button {
                    homeViewModel.showMatchSheet.toggle()
                } label: {
                    Image(systemName: "xmark.circle")
                        .font(.system(size: 46, weight: .medium))
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
