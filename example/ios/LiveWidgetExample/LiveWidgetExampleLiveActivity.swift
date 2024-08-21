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
    var date: Date
  }
  
  // Fixed non-changing properties about your activity go here!
  var name: String
}

struct LiveWidgetExampleLiveActivity: Widget {
  var body: some WidgetConfiguration {
    ActivityConfiguration(for: LiveWidgetExampleAttributes.self) { context in
      LockScreenView(context: context)
    } dynamicIsland: { context in
      DynamicIsland {
        DynamicIslandExpandedRegion(.leading) {
          dynamicIslandExpandedLeadingView(context: context)
        }
        
        DynamicIslandExpandedRegion(.trailing) {
          dynamicIslandExpandedTrailingView(context: context)
        }
        
        DynamicIslandExpandedRegion(.center) {
          dynamicIslandExpandedCenterView(context: context)
        }
        
        //                DynamicIslandExpandedRegion(.bottom) {
        //                    dynamicIslandExpandedBottomView(context: context)
        //                }
        //
      } compactLeading: {
        compactLeadingView(context: context)
      } compactTrailing: {
        compactTrailingView(context: context)
      } minimal: {
        minimalView(context: context)
      }
      .keylineTint(.cyan)
    }
  }
  
  
  //MARK: Expanded Views
  func dynamicIslandExpandedLeadingView(context: ActivityViewContext<LiveWidgetExampleAttributes>) -> some View {
    
    VStack{
      
      Text("Arsenal")
        .font(.caption2).bold()
      Image("arsenal").resizable().scaledToFit().cornerRadius(10)
        .frame(width: 60, height: 60)
      Text("0")
        .font(.headline).bold()
    }
    
    
    
  }
  
  func dynamicIslandExpandedTrailingView(context: ActivityViewContext<LiveWidgetExampleAttributes>) -> some View {
    VStack{
      
      
      Text("Man United")
        .font(.caption2).bold()
      Image("manchester").resizable().scaledToFit().cornerRadius(10)
        .frame(width: 60, height: 60)
      Text("2")
        .font(.headline).bold()
    }
    
  }
  
  func dynamicIslandExpandedBottomView(context: ActivityViewContext<LiveWidgetExampleAttributes>) -> some View {
    
    return VStack(alignment: .leading) {
      Text("Title")
        .font(.headline).frame(alignment: .leading)
      Text("Sub text")
        .font(.subheadline).frame(alignment: .leading)
    }
    
    
  }
  
  func dynamicIslandExpandedCenterView(context: ActivityViewContext<LiveWidgetExampleAttributes>) -> some View {
    VStack{
      Text("86 mins")
        .font(.headline)
      Text("Emirates Stadium").font(.caption2)
      Text("Referee: Michael Oliver").font(.footnote).italic()
    }
  }
  
  
  //MARK: Compact Views
  func compactLeadingView(context: ActivityViewContext<LiveWidgetExampleAttributes>) -> some View {
    
    Image(systemName: "football").foregroundColor(Color.green)
    
  }
  
  func compactTrailingView(context: ActivityViewContext<LiveWidgetExampleAttributes>) -> some View {
    
    
    Text("ARS 0-2 MUN").font(.caption2)
    
  }
  
  func minimalView(context: ActivityViewContext<LiveWidgetExampleAttributes>) -> some View {
    VStack(alignment: .center) {
      Image(systemName: "timer")
      Text(context.state.date, style: .timer)
        .multilineTextAlignment(.center)
        .monospacedDigit()
        .font(.caption2)
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
        LiveWidgetExampleAttributes.ContentState(emoji: "😀", date: Date())
     }
     
     fileprivate static var starEyes: LiveWidgetExampleAttributes.ContentState {
         LiveWidgetExampleAttributes.ContentState(emoji: "🤩", date: Date())
     }
}

@available(iOSApplicationExtension 16.1, *)
struct LockScreenView: View {
    var context: ActivityViewContext<LiveWidgetExampleAttributes>
    var body: some View {
       
            HStack {
                VStack(alignment: .center) {
                  Text("Chase")
                    .font(.caption2).bold()
                  Text("Katarzyna Niewiadoma")
                    .font(.headline).bold()
                }.frame(maxWidth: .infinity)
                .padding([.top], 60)
              
              VStack{
                Image("tdf").resizable().scaledToFit().cornerRadius(10)
                  .frame(width: 60, height: 60)
                Text("Stage 8: Le Grand-Bornand > Alpe D'Huez")
                  .font(.caption2).bold()
                Text("Time diff")
                  .font(.headline)
                Text("+1'4\"").font(.caption2)
              }.frame(maxWidth: .infinity)
              
              VStack{
                Text("Leader")
                .font(.caption2).bold()
                Text("Demi Vollering")
                  .font(.headline).bold()
              }.frame(maxWidth: .infinity)
              .padding([.top], 60)
              
            }.padding(10)
     
    }
}

struct BottomLineView: View {
    var time: Date
    var body: some View {
        HStack {
            Divider().frame(width: 50,
                            height: 10)
            .overlay(.gray).cornerRadius(5)
            Image("delivery")
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .stroke(style: StrokeStyle(lineWidth: 1,
                                               dash: [4]))
                    .frame(height: 10)
                    .overlay(Text(time, style: .timer).font(.system(size: 8)).multilineTextAlignment(.center))
            }
            Image("home-address")
        }
    }
}

#Preview("Notification", as: .content, using: LiveWidgetExampleAttributes.preview) {
   LiveWidgetExampleLiveActivity()
} contentStates: {
    LiveWidgetExampleAttributes.ContentState.smiley
    LiveWidgetExampleAttributes.ContentState.starEyes
}
