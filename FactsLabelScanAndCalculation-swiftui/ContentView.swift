//
//  ContentView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 26/5/2022.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        TabView{
            
            HomeView().tabItem {
                Label("Home", systemImage: "house.circle")
            }
            
            AnalysisView().tabItem {
                Label("Analysis", systemImage: "chart.bar.xaxis")
            }
            
            FoodInfoTable().tabItem {
                Label("New Food", systemImage: "camera.circle")
            }
            
            ScanView().tabItem {
                Label("Scan", systemImage: "camera.circle")
            }
            HistoryView().tabItem {
                Label("History", systemImage: "book.circle")
            }
            SettingView().tabItem {
                Label("Setting", systemImage: "gearshape.circle.fill")
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
