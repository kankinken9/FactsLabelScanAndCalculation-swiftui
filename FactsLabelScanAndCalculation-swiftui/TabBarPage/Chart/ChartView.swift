//
//  ChartView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 27/5/2022.
//

import SwiftUI

struct ChartView: View {
//    let chartData: [DataItem] = [
//        DataItem(name: "Mon", value: 898),
//        DataItem(name: "Tue", value: 670),
//        DataItem(name: "Wed", value: 725),
//        DataItem(name: "Thu", value: 439),
//        DataItem(name: "Fri", value: 1232),
//        DataItem(name: "Sat", value: 771),
//        DataItem(name: "Sun", value: 365)
//    ]

    let chartData: [DataItem]
    let chartTitle: String
//    let chartRange: String
    
    var body: some View {
        VStack {
            Text(chartTitle)
                .font(.title)

            BarChartView(
                title: "kilocalorie (kcal) per day", data: chartData)
                .frame(width: 350, height: 500, alignment: .center)

//            Spacer()
        }
    }
}
