//
//  Configuration.swift
//  
//
//  Created by Kamil Owczarz on 21/08/2024.
//

import Foundation
import AppIntents

@available(iOS 17.0, macOS 14.0, watchOS 10.0, *)
struct Configuration: AppIntent, WidgetConfigurationIntent, CustomIntentMigratedAppIntent {
    static let intentClassName = "ConfigurationIntent"

    static var title: LocalizedStringResource = "Configuration"
    static var description = IntentDescription("")

    static var parameterSummary: some ParameterSummary {
        Summary()
    }

    func perform() async throws -> some IntentResult {
        // TODO: Place your refactored intent handler code here.
        return .result()
    }
}


