//
//  LiveWidgetExampleBundle.swift
//  LiveWidgetExample
//
//  Created by Kamil Owczarz on 21/08/2024.
//

import WidgetKit
import SwiftUI

@main
struct LiveWidgetExampleBundle: WidgetBundle {
    var body: some Widget {
        LiveWidgetExample()
        LiveWidgetExampleLiveActivity()
    }
}
