//
//  SuperHero.swift
//  HeroWidgetApp
//
//  Created by Sezer on 15.01.2023.
//

import Foundation


struct SuperHero:Identifiable, Codable{
    let image : String
    let name : String
    let realName : String
    var id : String{image}
}

let superman = SuperHero(image: "superman", name: "Superman", realName: "Clark Kent")
let batman = SuperHero(image: "batman", name: "Batman", realName: "Bruce Wayne")
let spiderman = SuperHero(image: "spiderman", name: "Spiderman", realName: "Peter Parker")
