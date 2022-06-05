//
//  SettingView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 26/5/2022.
//

import SwiftUI

struct SettingView: View {
    //    @State private var tapCount = 0
    //    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    //        @AppStorage("tapCount") private var tapCount = 0
    
    //    @StateObject var settings = UserData()
    
    //    @State private var userAge = UserDefaults.standard.integer(forKey: "UserAge")
    
    @AppStorage("UserAge") var userAge = 30
    
    @AppStorage("UserProtein") var proteinList = 56.0
    
    @AppStorage("UserFatTotal") var fatTotalList = 39.0
    @AppStorage("UserFatSaturated") var fatSaturatedList = 0.0
    @AppStorage("UserFatTrans") var fatTransList = 0.0
    
    @AppStorage("UserCarbohydratesList") var carbohydratesList = 130.0
    @AppStorage("UserSugarsList") var sugarsList = 65.0
    
    @AppStorage("UserSodium") var sodiumList = 1.5
    @AppStorage("UserFiber") var fiberList = 14.0
    //    @AppStorage("UserEnergy") var energyList = 2000.0
    
    // 1 Calorie (1 Cal) = 1000 calorie (1000cal) = 1 kilocalorie = 1kcal
    @AppStorage("Userkcal") var kcalList = 2700
    //1 kilocalorie (kcal) = 4.184 kilojoule (kJ)
    
    //1克碳水化合物  含大約4kcal (千卡)
    //1克蛋白質  含大約 4kcal (千卡)
    //1克脂肪  含大約 9kcal (千卡)
    //1克酒精  含大約 7kcal (千卡)
    
    //每日從食物裡面所獲得的能量當中，約55-75%應該來自碳水化合物，約10-15%應來自蛋白質，約15-30%應來自脂肪。例如，每天需要 2000千卡能量的話，約1100-1500千卡應來自碳水化合物，約200-300千卡應來自蛋白質，約300-600千卡來自脂肪
    
    var body: some View {
        NavigationView {
            List{
                
                Section(header: Text("My age")){
                    Stepper("Age: \(userAge)", value: $userAge, in: 0...100, step: 1)
                }
                .onChange(of: userAge) { _ in
                    userCanEat()
                }
//                Picker("My age:", selection: $userAge) {
//                    ForEach(0 ..< 100) {
//                        Text("\($0) years old")
//                    }
//
//                }
//                .onChange(of: userAge) { _ in
//                    userCanEat()
//                }
                
                Section(header: Text("Your age Recommended kcal")){
                    HStack{
                        Text("kcal")
                        Spacer()
                        Text("\(kcalList)")
                            .multilineTextAlignment(.trailing)
                    }
                }
                
                Section(header: Text("Your age Recommended Dietary Intake(RDI)")){
                    SettingListText(textlabel: "Protein", textvalue: proteinList)
                    SettingListText(textlabel: "Fat Total", textvalue: fatTotalList)
                    SettingListText(textlabel: "Fat Saturated", textvalue: fatSaturatedList)
                    SettingListText(textlabel: "Fat Trans", textvalue: fatTransList)
                    
                    SettingListText(textlabel: "Carbohydrates", textvalue: carbohydratesList)
                    SettingListText(textlabel: "Sugars", textvalue: sugarsList)
                    SettingListText(textlabel: "Sodium", textvalue: sodiumList)
                    SettingListText(textlabel: "Fiber", textvalue: fiberList)
                    //                    SettingListText(textlabel: "Energy", textvalue: energyList)
                }
            }
            .navigationTitle("Setting")
        }
    }
    
    func userCanEat(){
        
        //1克碳水化合物  含大約4kcal (千卡)
        //1克蛋白質  含大約 4kcal (千卡)
        //1克脂肪  含大約 9kcal (千卡)
        //1克酒精  含大約 7kcal (千卡)
        
        //每日從食物裡面所獲得的能量當中，約55-75%應該來自碳水化合物，約10-15%應來自蛋白質，約15-30%應來自脂肪。例如，每天需要 2000千卡能量的話，約1100-1500千卡應來自碳水化合物，約200-300千卡應來自蛋白質，約300-600千卡來自脂肪
        
        //        proteinList = 56
        //
        //        fatTotalList = 0.0
        //        fatSaturatedList = 0.0
        //        fatTransList = 0
        //
        //        carbohydratesList = 130
        //        sugarsList = 65
        //
        //        sodiumList = 1.5
        //        fiberList = 14
        //
        switch userAge{
        case 0...6:
            kcalList = 0
        case 7...10:
            kcalList = 1950
        case 11...14:
            kcalList = 2650
        case 13...18:
            kcalList = 2900
        case 19...40:
            kcalList = 2700
        case 40...50:
            kcalList = 2700
        case 51...60:
            kcalList = 2600
        case 61...70:
            kcalList = 2200
        case 71...80:
            kcalList = 2100
        case 81...120:
            kcalList = 1900
        default:
            break
            
        }
        
        
        //        sodiumList = 1.5
        
        proteinList = Double(kcalList) * 0.25 / 4
        fatTotalList = Double(kcalList) * 0.25 / 9
        carbohydratesList = Double(kcalList) * 0.55 / 4
        
        sugarsList = Double(kcalList) * 0.10 / 4
        sodiumList = Double(kcalList) / 1800
        fiberList = Double(kcalList) * 0.014
    }
}


struct SettingListText: View {
    let textlabel: String
    let textvalue: Double
    
    
    var body: some View {
        HStack{
            Text(textlabel)
            Spacer()
            Text("\(textvalue, specifier: "%.1f") g")
                .multilineTextAlignment(.trailing)
        }
    }
}


struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
