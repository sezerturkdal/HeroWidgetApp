//
//  HeroWidgetBundle.swift
//  HeroWidget
//
//  Created by Sezer on 19.01.2023.
//

import WidgetKit
import SwiftUI

@main
struct HeroWidgetBundle: WidgetBundle {
    var body: some Widget {
        HeroWidget()
        HeroWidgetLiveActivity()
    }
}
