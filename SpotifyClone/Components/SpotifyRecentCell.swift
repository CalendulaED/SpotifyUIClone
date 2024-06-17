//
//  SpotifyRecentCell.swift
//  SpotifyClone
//
//  Created by Yuxuan Wu on 5/24/24.
//

import SwiftUI

struct SpotifyRecentCell: View {
    
    var imageName: String = Constants.randomImage
    var title: String = "Some random title"
    
    var body: some View {
        HStack {
            ImageLoaderView(urlString: imageName)
                .frame(width: 55, height: 55)
            
            Text(title)
                .font(.callout)
                .fontWeight(.semibold)
                .lineLimit(2)
        }
        .padding(.trailing, 8)
        .frame(maxWidth: .infinity, alignment: .leading)
        .themeColors(isSelected: false)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

#Preview {
    SpotifyRecentCell()
}
