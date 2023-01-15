//
//  CircularImageView.swift
//  HeroWidgetApp
//
//  Created by Sezer on 15.01.2023.
//

import SwiftUI

struct CircularImageView: View {
    var image:Image
    var body: some View {
        image.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.green, lineWidth: 5))
            .shadow(radius: 2)
    }
}

struct CircularImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircularImageView(image: Image("batman"))
    }
}
