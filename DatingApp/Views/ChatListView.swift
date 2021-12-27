//
//  ChatListView.swift
//  DatingApp
//
//  Created by Arman Abkar on 12/6/21.
//

import SwiftUI

struct ChatListView: View {
    
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ForEach(homeViewModel.characters.prefix(5), id: \.id) { character in
                HStack(alignment: .center) {
                    AsyncImage(url: URL(string: "\(K.URL.baseURL)/\(character.image)")) { image in
                        image
                            .resizable()
                            .frame(width: 70, height: 70)
                    } placeholder: {
                        Color.gray
                            .opacity(0.2)
                            .frame(width: 70, height: 70)
                    }
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.title2)
                            .bold()
                        Text("Lorem ipsum ipsum lorem ipsum ipsum lorem ipsum ipsum dorem lorem...")
                            .font(.footnote)
                            .foregroundColor(.black.opacity(0.7))
                        
                    }
                    .padding(.trailing, 5)
                    .padding(.vertical, 5)
                }
                .background(Color.pink.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            }
        }
        .task {
            await homeViewModel.getCharacters()
        }
    }
}

struct ChatListView_Previews: PreviewProvider {
    static var previews: some View {
        ChatListView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
