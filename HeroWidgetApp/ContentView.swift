//
//  ContentView.swift
//  HeroWidgetApp
//
//  Created by Sezer on 15.01.2023.
//

import SwiftUI

let superHeroArray = [superman,batman,spiderman]

struct ContentView: View {
    var body: some View {
        VStack {
            ForEach(superHeroArray) { item in
                HeroView(hero: item)
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
