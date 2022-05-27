//
//  ChartView2.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 27/5/2022.
//

import SwiftUI

struct ChartView2: View {
    let chartData: [DataItem] = [
        DataItem(name: "Mon", value: 898),
        DataItem(name: "Tue", value: 670),
        DataItem(name: "Wed", value: 725),
        DataItem(name: "Thu", value: 439),
        DataItem(name: "Fri", value: 1232),
        DataItem(name: "Sat", value: 771),
        DataItem(name: "Sun", value: 365)
    ]

    var body: some View {
        VStack {
            Text("Sample Bar Chart")
                .font(.title)

            BarChartView(
                title: "Daily step count", data: chartData)
                .frame(width: 350, height: 500, alignment: .center)

            Spacer()
        }
    }
}

struct ChartView2_Previews: PreviewProvider {
    static var previews: some View {
        ChartView2()
    }
}
