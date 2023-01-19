//
//  HeroWidget.swift
//  HeroWidget
//
//  Created by Sezer on 19.01.2023.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
    
    @AppStorage("hero",store: UserDefaults(suiteName: "group.com.sezerturkdal.HeroWidgetApp"))
    
    var heroData : Data = Data()
    
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: SuperHero(image: "batman", name: "batman", realName: "Bruce Wayne"))
    }

    func getSnapshot(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (SimpleEntry) -> ()) {
        
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            completion(entry)
        }
    }

    func getTimeline(for configuration: ConfigurationIntent, in context: Context, completion: @escaping (Timeline<Entry>) -> ()) {
        if let hero = try? JSONDecoder().decode(SuperHero.self, from: heroData){
            let entry = SimpleEntry(date: Date(), configuration: configuration, hero: hero)
            
            let timeline = Timeline(entries: [entry], policy: .never)
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let configuration: ConfigurationIntent
    let hero: SuperHero
}

struct HeroWidgetEntryView : View {
    var entry: Provider.Entry

    var body: some View {
        CircularImageView(image: Image(entry.hero.image))
    }
}

struct HeroWidget: Widget {
    let kind: String = "HeroWidget"

    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ConfigurationIntent.self, provider: Provider()) { entry in
            HeroWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Hero Widget")
        .description("This is an example widget.")
    }
}

struct HeroWidget_Previews: PreviewProvider {
    static var previews: some View {
        HeroWidgetEntryView(entry: SimpleEntry(date: Date(), configuration: ConfigurationIntent(), hero: batman))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
}
