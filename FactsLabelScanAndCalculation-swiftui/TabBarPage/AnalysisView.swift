//
//  AnalysisView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 22/5/2022.
//

import SwiftUI
import CoreData

struct AnalysisView: View {
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
    
    
    //    @State private var startDate = Date()
    //    @State private var EndDate = Date() + 86400
//
//    @FetchRequest(
//        entity: Foodinfo.entity(),
//        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
//        //                   predicate: NSPredicate(value: Calendar.current.isDateInToday(Date()))
//        //        predicate: NSPredicate(format: "timestamp >= %@", Date() as NSDate)
//        //                   predicate: NSPredicate(format: "date <= %@ AND  date >= %@", Date() as NSDate)
//        //        predicate: NSPredicate(format : "timestamp <= %@ AND  timestamp >= %@", dateTo! as CVarArg, dateFrom as CVarArg)
//        //        predicate: NSPredicate(value: Calendar.current.isDateInToday(timestamp))
//        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
//    ) var Foodinfos: FetchedResults<Foodinfo>
//
    
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
    
    
    var body: some View {
        
        NavigationView {
            List{
                NavigationLink {
                    ThreeDayView()
                } label: {
                    Text("3 Day")
                }
                NavigationLink {
                    WeekDayView()
                } label: {
                    Text("7 Day")
                }
                NavigationLink {
                    MonthDayView()
                } label: {
                    Text("1 Month")
                }
                
                
                
                //
                //                        ForEach(Foodinfos) {food in
                //
                ////                            protein += food.protein
                ////
                ////                            fatTotal += food.fatTotal
                ////                            fatSaturated += food.fatSaturated
                ////                            fatTrans += food.fatTrans
                ////
                ////                            carbohydrates += food.carbohydrates
                ////                            sugars += food.sugars
                ////
                ////                            sodium += food.sodium
                ////                            fiber += food.fiber
                //            //                kcal += food.kcal
                //
                //                            NavigationLink {
                //                                FoodDetailView(food: food)
                //                            } label: {
                //                                HStack {
                //                                    Text(food.foodName ?? "Unknown Title")
                //                                    //                        Spacer()
                //                                    //                        VStack{
                //                                    //                            Text(food.timestamp ?? Date() , style: .date)
                //                                    //                            Text(food.timestamp ?? Date() , style: .time)
                //                                    //                        }
                //                                }
                //                            }
                //                        }
                
                
//                Text("Your age \(userAge)")
//                Section(header: Text("Your Recommended kcal Limit")){
//                    HStack{
//                        Text("kcal")
//                        Spacer()
//                        Text("\(kcalList) / \(kcalList)")
//                            .multilineTextAlignment(.trailing)
//                    }
//                }
//
//                Section(header: Text("Your age Recommended Dietary Intake(RDI)")){
//                    HomelListText(textlabel: "Protein", textvalue: proteinList, todayvalue: Foodinfos.map { $0.protein }.reduce(0, +))
//                    HomelListText(textlabel: "Fat Total", textvalue: fatTotalList, todayvalue: Foodinfos.map { $0.fatTotal }.reduce(0, +))
//                    HomelListText(textlabel: "Fat Saturated", textvalue: fatSaturatedList, todayvalue: Foodinfos.map { $0.fatSaturated }.reduce(0, +))
//                    HomelListText(textlabel: "Fat Trans", textvalue: fatTransList, todayvalue: Foodinfos.map { $0.fatTrans }.reduce(0, +))
//
//                    HomelListText(textlabel: "Carbohydrates", textvalue: carbohydratesList, todayvalue: Foodinfos.map { $0.carbohydrates }.reduce(0, +))
//                    HomelListText(textlabel: "Sugars", textvalue: sugarsList, todayvalue: Foodinfos.map { $0.sugars }.reduce(0, +))
//                    HomelListText(textlabel: "Sodium", textvalue: sodiumList, todayvalue: Foodinfos.map { $0.sodium }.reduce(0, +))
//                    HomelListText(textlabel: "Fiber", textvalue: fiberList, todayvalue: Foodinfos.map { $0.fiber }.reduce(0, +))
//                }
            }
        }
    }
}



//struct AnalysisPage: View {
//    
//    @FetchRequest(
//        entity: Foodinfo.entity(),
//        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
//        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
//    ) var Foodinfos: FetchedResults<Foodinfo>
//    
//    
////    let textlabel: String
////    let textvalue: Double
////    let todayvalue: Double
//    
//    
////    var body: some View {
//////        HStack{
//////            Text(textlabel)
//////            Spacer()
//////            Text("\(todayvalue, specifier: "%.1f") / \(textvalue, specifier: "%.1f") g")
//////                .multilineTextAlignment(.trailing)
//////        }
////    }
//}


struct ThreeDayView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Foodinfo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date()) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
    ) var Foodinfos: FetchedResults<Foodinfo>
    
    
    
    var body: some View {
        Text("\(Foodinfos.count)")
    }
}
struct WeekDayView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Foodinfo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date() - 86400 * 7) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
    ) var Foodinfos: FetchedResults<Foodinfo>
    
    
    
    var body: some View {
        Text("\(Foodinfos.count)")
    }
}
struct MonthDayView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Foodinfo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date() - 86400 * 30) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
    ) var Foodinfos: FetchedResults<Foodinfo>
    
    
    
    var body: some View {
        Text("\(Foodinfos.count)")
    }
}


struct AnalysisListText: View {
    let textlabel: String
    let textvalue: Double
    let todayvalue: Double
    
    
    var body: some View {
        HStack{
            Text(textlabel)
            Spacer()
            Text("\(todayvalue, specifier: "%.1f") / \(textvalue, specifier: "%.1f") g")
                .multilineTextAlignment(.trailing)
        }
    }
}
struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
