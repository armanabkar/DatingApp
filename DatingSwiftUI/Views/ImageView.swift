//
//  ImageView.swift
//  DatingSwiftUI
//
//  Created by Arman Abkar on 7/26/21.
//

import SwiftUI

struct ImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    @State var image: UIImage = UIImage()
    
    init(withURL url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        Image(uiImage: image)
            .resizable()
            .cornerRadius(24)
            .scaledToFit()
            .frame(minWidth: 0, maxWidth: .infinity)
            .onReceive(imageLoader.didChange) { data in
                self.image = UIImage(data: data) ?? UIImage(systemName: K.Icon.profile)!
            }
    }
}
