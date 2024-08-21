import ActivityKit
import SwiftUI

struct LiveWidgetExampleAttributes: ActivityAttributes {
  public struct ContentState: Codable, Hashable {
    // Dynamic stateful properties about your activity go here!
    var emoji: String
    var date: Date
  }
  
  // Fixed non-changing properties about your activity go here!
  var name: String
}
