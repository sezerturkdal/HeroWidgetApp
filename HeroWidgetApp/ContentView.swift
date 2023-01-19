//
//  ContentView.swift
//  HeroWidgetApp
//
//  Created by Sezer on 15.01.2023.
//

import SwiftUI

let superHeroArray = [superman,batman,spiderman]

struct ContentView: View {
    
    @AppStorage("hero",store: UserDefaults(suiteName: "group.com.sezerturkdal.HeroWidgetApp"))
    
    var heroData : Data = Data()
    
    var body: some View {
        VStack {
            ForEach(superHeroArray) { item in
                HeroView(hero: item).onTapGesture{
                    saveToDefaults(hero: item)
                }
            }
        }
        .padding()
    }
    
    func saveToDefaults(hero:SuperHero){
        if let heroDataJson = try? JSONEncoder().encode(hero){
            self.heroData = heroDataJson
            print(hero.name)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
