//
//  HeroView.swift
//  HeroWidgetApp
//
//  Created by Sezer on 15.01.2023.
//

import SwiftUI

struct HeroView: View {
    let hero : SuperHero
    var body: some View {
        HStack{
            CircularImageView(image: Image(hero.image))
                .frame(width: 100, height: 100, alignment: .center)
                .padding()
            Spacer()
            VStack{
                Text(hero.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.green)
                Text(hero.realName)
                    .fontWeight(.light)
            }.padding()
            Spacer()
        }.frame(width: UIScreen.main.bounds.width, alignment: .center)
            .background(Color.gray.opacity(0.2))
    }
}

struct HeroView_Previews: PreviewProvider {
    static var previews: some View {
        HeroView(hero:batman)
    }
}
