//
//  BarChart.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 27/5/2022.
//

import SwiftUI

struct DataItem: Identifiable {
    let name: String
    let value: Double
    let id = UUID()
}

struct BarChartView: View {
    var title: String
    var data: [DataItem]

    var body: some View {
        GeometryReader { gr in
            let headHeight = gr.size.height * 0.10
            VStack {
                ChartHeaderView(title: title, height: headHeight)
                ChartAreaView(data: data)
            }
        }
    }
}

struct ChartHeaderView: View {
    var title: String
    var height: CGFloat

    var body: some View {
        Text(title)
            .frame(height: height)
    }
}

struct ChartAreaView: View {
    var data: [DataItem]

    var body: some View {
        GeometryReader { gr in
            let fullBarHeight = gr.size.height * 0.90
            let maxValue = data.map { $0.value }.max()!

            ZStack {
                RoundedRectangle(cornerRadius: 5.0)
                    .fill(Color(#colorLiteral(red: 0.8906477705, green: 0.9005050659, blue: 0.8208766097, alpha: 1)))

                VStack {
                    HStack(spacing:0) {
                        ForEach(data) { item in
                            BarView(
                                name: item.name,
                                value: item.value,
                                maxValue: maxValue,
                                fullBarHeight: Double(fullBarHeight))
                        }
                    }
                    .padding(4)
                }

            }
        }
    }
}
