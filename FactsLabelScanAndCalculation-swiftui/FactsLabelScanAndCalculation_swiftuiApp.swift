//
//  FactsLabelScanAndCalculation_swiftuiApp.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 22/5/2022.
//

import SwiftUI

@main
struct FactsLabelScanAndCalculation_swiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
