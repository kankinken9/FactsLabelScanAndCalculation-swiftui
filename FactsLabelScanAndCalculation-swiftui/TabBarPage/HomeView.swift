//
//  HomeView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 22/5/2022.
//

import SwiftUI
import CoreData

struct HomeView: View {
    
    @Environment(\.managedObjectContext) var moc
    //    @FetchRequest var Foodinfos: FetchedResults<Foodinfo>
    
    
    //    @FetchRequest(sortDescriptors: [
    //        SortDescriptor(\.timestamp, order: .reverse),
    //    ]) var Foodinfos: FetchedResults<Foodinfo>
    
    
    //    @FetchRequest(entity: Foodinfo.entity(),
    //                  sortDescriptors: [NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false)],
    //                  //                      SortDescriptor(\.timestamp, order: .reverse),
    //                  predicate: NSPredicate(format: "date > %@", Date() as NSDate)) var Foodinfos: FetchedResults<Foodinfo>
    
    //    var calendar = Calendar.current
    //    calendar.timeZone = NSTimeZone.local
    //    let dateFrom = calendar.startOfDay(for: Date()) // eg. 2016-10-10 00:00:00
    //    let dateTo = calendar.date(byAdding: .day, value: 1, to: dateFrom)
    
    //    let calendar = Calendar.current
    //    let dateFrom = calendar.startOfDay(for: Date()) // eg. 2016-10-10 00:00:00
    //    let dateTo = calendar.date(byAdding: .day, value: 1, to: dateFrom)
    
    //    let predicate = NSPredicate(format: "creationDate >= %@", startDate as CVarArg)
    
    
    @FetchRequest(
        entity: Foodinfo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
        //                   predicate: NSPredicate(value: Calendar.current.isDateInToday(Date()))
        //        predicate: NSPredicate(format: "timestamp >= %@", Date() as NSDate)
        //                   predicate: NSPredicate(format: "date <= %@ AND  date >= %@", Date() as NSDate)
        //        predicate: NSPredicate(format : "timestamp <= %@ AND  timestamp >= %@", dateTo! as CVarArg, dateFrom as CVarArg)
        //        predicate: NSPredicate(value: Calendar.current.isDateInToday(timestamp))
        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
    ) var Foodinfos: FetchedResults<Foodinfo>
    
    
    //    private var calendar = Calendar.current
    //    private var beginDate = calendar.date(byAdding: .day, value: -7, to: Date())!
    
    
    @AppStorage("UserAge") var userAge = 30
    @AppStorage("UserProtein") var proteinList = 56.0
    
    @AppStorage("UserFatTotal") var fatTotalList = 39.0
    @AppStorage("UserFatSaturated") var fatSaturatedList = 0.0
    @AppStorage("UserFatTrans") var fatTransList = 0.0
    
    @AppStorage("UserCarbohydratesList") var carbohydratesList = 130.0
    @AppStorage("UserSugarsList") var sugarsList = 65.0
    
    @AppStorage("UserSodium") var sodiumList = 1.5
    @AppStorage("UserFiber") var fiberList = 14.0
    @AppStorage("Userkcal") var kcalList = 2700
    
    //    let aaa = Foodinfos.map { $0.protein }.reduce(0, +)
    
    //    @State private var userAge = 0.0
    @State private var protein = 0.0
    
    @State private var fatTotal = 0.0
    @State private var fatSaturated = 0.0
    @State private var fatTrans = 0.0
    
    @State private var carbohydrates = 0.0
    @State private var sugars = 0.0
    
    @State private var sodium = 0.0
    @State private var fiber = 0.0
    @State private var kcal = 0
    
    //    @State private var userAge = UserDefaults.standard.integer(forKey: "UserAge")
    
    //    @EnvironmentObject var settings: UserData
    
    
    @State private var ThisData: [DataItem] = []
    
    var body: some View {
        
        //        NavigationView{
        List{
            //            Text("Your age \(userAge)")
            
            Section(header: Text("Your Recommended kcal limit")){
                HStack{
                    Text("kcal")
                    Spacer()
                    Text("\(kcal) / \(kcalList)")
                        .multilineTextAlignment(.trailing)
                        .foregroundColor(kcal > kcalList ? .red : .black)
                }
            }
            Section(header: Text("Your age Recommended Dietary Intake(RDI)")){
                HomelListText(textlabel: "Protein", textvalue: proteinList, todayvalue: Foodinfos.map { $0.protein }.reduce(0, +))
                HomelListText(textlabel: "Fat Total", textvalue: fatTotalList, todayvalue: Foodinfos.map { $0.fatTotal }.reduce(0, +))
                HomelListText(textlabel: "Fat  Saturated", textvalue: fatSaturatedList, todayvalue: Foodinfos.map { $0.fatSaturated }.reduce(0, +))
                HomelListText(textlabel: "Fat Trans", textvalue: fatTransList, todayvalue: Foodinfos.map { $0.fatTrans }.reduce(0, +))
                
                HomelListText(textlabel: "Carbohydrates", textvalue: carbohydratesList, todayvalue: Foodinfos.map { $0.carbohydrates }.reduce(0, +))
                HomelListText(textlabel: "Sugars", textvalue: sugarsList, todayvalue: Foodinfos.map { $0.sugars }.reduce(0, +))
                HomelListText(textlabel: "Sodium", textvalue: sodiumList, todayvalue: Foodinfos.map { $0.sodium }.reduce(0, +))
                HomelListText(textlabel: "Fiber", textvalue: fiberList, todayvalue: Foodinfos.map { $0.fiber }.reduce(0, +))
            }
            BarChartView(
                title: "Daily kacl", data: ThisData)
            .frame(width: 320, height: 500, alignment: .center)
            
            
        }
        .onAppear{
            KcalData()
            SumKcal()
        }
        //        }
    }
    
    func KcalData(){
        var FnData: [DataItem] = []
        FnData.append(DataItem(name: "Pro", value: Foodinfos.map { $0.protein }.reduce(0, +)))
        FnData.append(DataItem(name: "FTo", value: Foodinfos.map { $0.fatTotal }.reduce(0, +)))
        FnData.append(DataItem(name: "FSt", value: Foodinfos.map { $0.fatSaturated }.reduce(0, +)))
        FnData.append(DataItem(name: "FTs", value: Foodinfos.map { $0.fatTrans }.reduce(0, +)))
        
        FnData.append(DataItem(name: "Ca", value: Foodinfos.map { $0.carbohydrates }.reduce(0, +)))
        FnData.append(DataItem(name: "Su", value: Foodinfos.map { $0.sugars }.reduce(0, +)))
        FnData.append(DataItem(name: "So", value: Foodinfos.map { $0.sodium }.reduce(0, +)))
        FnData.append(DataItem(name: "Fi", value: Foodinfos.map { $0.fiber }.reduce(0, +)))
        ThisData = FnData
    }
    
    func SumKcal(){
        var Total = 0.0
        
        
        Total = Foodinfos.map {(
            //            $0.protein * 4 / 0.25 +
            //            $0.fatTotal * 9 / 0.25 +
            //            $0.fatSaturated +
            //            $0.fatTrans +
            //            $0.carbohydrates  * 4 / 0.55 +
            //            $0.sugars * 4 / 0.10 +
            ////            $0.sodium  * 1800 +
            //            $0.sodium +
            //            $0.fiber / 0.014
            
            
            $0.protein * 4 +
            $0.fatTotal * 9 +
            $0.fatSaturated +
            $0.fatTrans +
            $0.carbohydrates * 4 +
            $0.sugars * 4 +
            //            $0.sodium  * 1800 +
            $0.sodium +
            $0.fiber
            
            //            $0.protein * 0.25 / 4 +
            //            $0.fatTotal * 0.25 / 9  +
            //            $0.fatSaturated +
            //            $0.fatTrans +
            //            $0.carbohydrates * 0.55 / 4 +
            //            $0.sugars * 0.10 / 4 +
            ////            $0.sodium  * 1800 +
            //            $0.sodium / 1800 +
            //            $0.fiber * 0.014
        )
        }.reduce(0, +)
        
        kcal = Int(Total)
    }
} 

struct HomelListText: View {
    let textlabel: String
    let textvalue: Double
    let todayvalue: Double
    
    
    var body: some View {
        HStack{
            Text(textlabel)
            Spacer()
            Text("\(todayvalue, specifier: "%.1f") / \(textvalue, specifier: "%.1f") g")
                .multilineTextAlignment(.trailing)
                .foregroundColor(todayvalue > textvalue ? .red : .black)
        }
    }
}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
