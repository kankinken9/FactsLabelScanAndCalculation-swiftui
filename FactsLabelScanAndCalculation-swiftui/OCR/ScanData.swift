//
//  ScanData.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 27/5/2022.
//

import Foundation


struct ScanData:Identifiable {
    var id = UUID()
    let content:String
    
    init(content:String) {
        self.content = content
    }
}
