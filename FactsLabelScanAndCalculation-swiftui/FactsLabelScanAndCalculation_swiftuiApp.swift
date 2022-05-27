//
//  FactsLabelScanAndCalculation_swiftuiApp.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 22/5/2022.
//

import SwiftUI

@main
struct FactsLabelScanAndCalculation_swiftuiApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
