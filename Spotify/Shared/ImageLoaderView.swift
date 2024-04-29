//
//  ImageLoaderView.swift
//  Spotify
//
//  Created by Akmalkhon on 29/04/24.
//

import SwiftUI
import SDWebImageSwiftUI


struct ImageLoaderView: View {
    
    var urlString: String = Constans.randomImage
    let resizingMode: ContentMode = .fill
    
    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: URL(string: urlString))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: resizingMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .padding(40)
        .padding(.vertical, 60)

}
