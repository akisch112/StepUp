//
//  StepUpHabitTrackerWidgetLiveActivity.swift
//  StepUpHabitTrackerWidget
//
//  Created by Alex  Kisch on 7/27/24.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct StepUpHabitTrackerWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct StepUpHabitTrackerWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: StepUpHabitTrackerWidgetAttributes.self) { context in
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

extension StepUpHabitTrackerWidgetAttributes {
    fileprivate static var preview: StepUpHabitTrackerWidgetAttributes {
        StepUpHabitTrackerWidgetAttributes(name: "World")
    }
}

extension StepUpHabitTrackerWidgetAttributes.ContentState {
    fileprivate static var smiley: StepUpHabitTrackerWidgetAttributes.ContentState {
        StepUpHabitTrackerWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: StepUpHabitTrackerWidgetAttributes.ContentState {
         StepUpHabitTrackerWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: StepUpHabitTrackerWidgetAttributes.preview) {
   StepUpHabitTrackerWidgetLiveActivity()
} contentStates: {
    StepUpHabitTrackerWidgetAttributes.ContentState.smiley
    StepUpHabitTrackerWidgetAttributes.ContentState.starEyes
}
