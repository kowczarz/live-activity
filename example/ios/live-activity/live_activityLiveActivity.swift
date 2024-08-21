//
//  live_activityLiveActivity.swift
//  live-activity
//
//  Created by Kamil Owczarz on 21/08/2024.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct live_activityAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct live_activityLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: live_activityAttributes.self) { context in
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

extension live_activityAttributes {
    fileprivate static var preview: live_activityAttributes {
        live_activityAttributes(name: "World")
    }
}

extension live_activityAttributes.ContentState {
    fileprivate static var smiley: live_activityAttributes.ContentState {
        live_activityAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: live_activityAttributes.ContentState {
         live_activityAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: live_activityAttributes.preview) {
   live_activityLiveActivity()
} contentStates: {
    live_activityAttributes.ContentState.smiley
    live_activityAttributes.ContentState.starEyes
}
