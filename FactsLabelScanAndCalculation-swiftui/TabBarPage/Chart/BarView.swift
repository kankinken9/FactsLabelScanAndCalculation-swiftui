//
//  BarView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 27/5/2022.
//

import SwiftUI

struct BarView: View {
    var name: String
    var value: Double
    var maxValue: Double
    var fullBarHeight: Double

    var body: some View {
        let barHeight = (Double(fullBarHeight) / maxValue) * value
        VStack {
            Spacer()
            ZStack {
                VStack {
                    Spacer()
                    RoundedRectangle(cornerRadius:5.0)
                        .fill(Color.blue)
                        .frame(height: CGFloat(barHeight), alignment: .trailing)
                }

                VStack {
                    Spacer()
                    Text("\(value, specifier: "%.0F")")
                        .font(.footnote)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                }
            }
            Text(name)
        }
        .padding(.horizontal, 4)
    }
}
