//
//  DataController.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 26/5/2022.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "FoodLabel")

    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
