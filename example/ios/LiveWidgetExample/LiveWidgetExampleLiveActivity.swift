//
//  LiveWidgetExampleLiveActivity.swift
//  LiveWidgetExample
//
//  Created by Kamil Owczarz on 21/08/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct LiveWidgetExampleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct LiveWidgetExampleLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: LiveWidgetExampleAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension LiveWidgetExampleAttributes {
    fileprivate static var preview: LiveWidgetExampleAttributes {
        LiveWidgetExampleAttributes(name: "World")
    }
}

extension LiveWidgetExampleAttributes.ContentState {
    fileprivate static var smiley: LiveWidgetExampleAttributes.ContentState {
        LiveWidgetExampleAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: LiveWidgetExampleAttributes.ContentState {
         LiveWidgetExampleAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: LiveWidgetExampleAttributes.preview) {
   LiveWidgetExampleLiveActivity()
} contentStates: {
    LiveWidgetExampleAttributes.ContentState.smiley
    LiveWidgetExampleAttributes.ContentState.starEyes
}
