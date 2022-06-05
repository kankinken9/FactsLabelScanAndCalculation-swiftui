//
//  ContentView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 26/5/2022.
//

import SwiftUI

struct ContentView: View {
//    @State private var tabSelection = 1
//    @State private var selectedTab = 1
    var body: some View {
//        TabView(selection: $selectedTab) {
            TabView (){
                
            HomeView().tabItem {
                Label("Home", systemImage: "house.circle")
            }.tag(1)
            
            AnalysisView().tabItem {
                Label("Analysis", systemImage: "chart.bar.xaxis")
            }.tag(2)
            
            FoodInfoTable().tabItem {
                Label("New Food", systemImage: "camera.circle")
            }.tag(3)
            
            HistoryView().tabItem {
                Label("History", systemImage: "book.circle")
            }.tag(4)
            
            SettingView().tabItem {
                Label("Setting", systemImage: "gearshape.circle.fill")
            }.tag(5)
                
            ScanView().tabItem {
                Label("Debug AI & Scan", systemImage: "camera.circle")
            }.tag(6)
            

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
