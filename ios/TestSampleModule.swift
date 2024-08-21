import ExpoModulesCore
import SwiftUI
import ActivityKit


struct LiveWidgetExampleAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
        var date: Date
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

@available(iOS 16.1, *)
func createActivity() {
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in

      if let error = error {
        // Handle the error here.
        print(error.localizedDescription)
      }
      // Enable or disable features based on the authorization.
    }

    let attributes = LiveWidgetExampleAttributes(name: "Test")
    let contentState = LiveWidgetExampleAttributes.ContentState(emoji: "🚲", date: .now + 120 )
    do {
      let _ = try Activity.request(
        attributes: attributes,
        contentState: contentState)
    } catch (let error) {
      print(error)
    }
}

@available(iOS 16.1, *)
func endAllActivities() {
    Task {
     for activity in Activity<LiveWidgetExampleAttributes>.activities{
       await activity.end(dismissalPolicy: .immediate)
     }
   }
}

public class TestSampleModule: Module {
  public func definition() -> ModuleDefinition {
    Name("TestSample")

    Function("createActivity") {
        if #available(iOS 16.1, *) {
            createActivity()
        }
    }

    Function("endAllActivities") {
        if #available(iOS 16.1, *) {
            endAllActivities()
        }
    }
  }
}
