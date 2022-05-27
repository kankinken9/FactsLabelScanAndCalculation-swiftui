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

//struct ChartView: View {
////    let chartData: [DataItem] = [
////        DataItem(name: "Mon", value: 898),
////        DataItem(name: "Tue", value: 670),
////        DataItem(name: "Wed", value: 725),
////        DataItem(name: "Thu", value: 439),
////        DataItem(name: "Fri", value: 1232),
////        DataItem(name: "Sat", value: 771),
////        DataItem(name: "Sun", value: 365)
////    ]
//    let chartData: [DataItem]
//
//    var body: some View {
//        VStack {
//            Text("Sample Bar Chart")
//                .font(.title)
//
//            BarChartView(
//                title: "Daily step count", data: chartData)
//                .frame(width: 350, height: 500, alignment: .center)
//
//            Spacer()
//        }
//    }
//}


struct ThreeDayView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Foodinfo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date() - 86400 * 3) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
    ) var Foodinfos: FetchedResults<Foodinfo>
        
    @State private var ThisData: [DataItem] = [
        DataItem(name: "Mon", value: 898),
    ]
    
    var Total = 0.0
    
    var body: some View {
        VStack{
            ChartView(chartData: ThisData, chartTitle: "3 Day Report")
        }
        .onAppear{Loopdate()}
        
    }
    
    func Loopdate(){
        let startday = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        var FnData: [DataItem] = []
        
        for number in 0...2{
            var daytotal = Foodinfos
                .filter(){
                    formatter.string(for: $0.timestamp) as! String == formatter.string(from: Date() - TimeInterval(86400 * number))
                }
                .map {(
                    
                    $0.protein * 4 / 0.25 +
                    $0.fatTotal * 9 / 0.25 +
                    $0.fatSaturated +
                    $0.fatTrans +
                    $0.carbohydrates  * 4 / 0.55 +
                    $0.sugars * 4 / 0.10 +
                    $0.sodium  * 1800 +
                    $0.fiber / 0.014
                )
                }.reduce(0, +)
            
            //95108
            //        ForEach(Foodinfos){ aa in
            //            print(aa.timestamp)
            //        }
            
            let calendarDate = Calendar.current.dateComponents([.day], from: Date() - TimeInterval(86400 * number))
            FnData.append(DataItem(name: "\(calendarDate.day ?? 0)", value: daytotal))
        }
//        print(Foodinfos)
//        print(
//            Foodinfos.map {
//                //                print("MAP : \($0)")
//                print("time : \($0)")
//            }
//        )
//        print("Day \(daytotal)")
//        print(startday)
        //        print((startday, format: .dateTime.day().month().year())
        //        print((startday.date .dateTime.day().month().year())
//        let calendarDate = Calendar.current.dateComponents([.day, .year, .month], from: Date())
//        let calendarDate = Calendar.current.dateComponents([.day], from: Date())
//        print(calendarDate.day)
        
//        let dateString = formatter.dateFormat = "dd"
//        dateString = formatter.string(from: Date() )
//        print(dateString)
        
        //        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "MM/dd/yyyy"
        //        let date = dateFormatter.date(from: startday)
        //        dateFormatter.dateFormat = "yyyy-MM-dd"
        //        let resultString = dateFormatter.string(from: date!)
        //        print(resultString)
        
        //        ForEach(Foodinfos) { food in
        //            print(food.foodName)
        //            print(food.timestamp)
        //        }
        
        ThisData = FnData
    }
}
struct WeekDayView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Foodinfo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date() - 86400 * 7) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
    ) var Foodinfos: FetchedResults<Foodinfo>
    
    
    @State private var ThisData: [DataItem] = [
        DataItem(name: "Mon", value: 898),
    ]
    
    var Total = 0.0
    
    var body: some View {
        VStack{
            ChartView(chartData: ThisData, chartTitle: "Week Report")
        }
        .onAppear{Loopdate()}
        
    }
    
    func Loopdate(){
        let startday = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        var FnData: [DataItem] = []
        
        for number in 0...6{
            var daytotal = Foodinfos
                .filter(){
                    formatter.string(for: $0.timestamp) as! String == formatter.string(from: Date() - TimeInterval(86400 * number))
                }
                .map {(
                    
                    $0.protein * 4 / 0.25 +
                    $0.fatTotal * 9 / 0.25 +
                    $0.fatSaturated +
                    $0.fatTrans +
                    $0.carbohydrates  * 4 / 0.55 +
                    $0.sugars * 4 / 0.10 +
                    $0.sodium  * 1800 +
                    $0.fiber / 0.014
                )
                }.reduce(0, +)
            let calendarDate = Calendar.current.dateComponents([.day], from: Date() - TimeInterval(86400 * number))
            FnData.append(DataItem(name: "\(calendarDate.day ?? 0)", value: daytotal))
        }
        ThisData = FnData
    }
}
struct MonthDayView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        entity: Foodinfo.entity(),
        sortDescriptors: [ NSSortDescriptor(keyPath: \Foodinfo.timestamp, ascending: false) ],
        predicate: NSPredicate(format: "timestamp >= %@ && timestamp <= %@", Calendar.current.startOfDay(for: Date() - 86400 * 30) as CVarArg, Calendar.current.startOfDay(for: Date() + 86400) as CVarArg)
    ) var Foodinfos: FetchedResults<Foodinfo>
    
    
    
    @State private var ThisData: [DataItem] = [
        DataItem(name: "Mon", value: 898),
    ]
    
    var Total = 0.0
    
    var body: some View {
        VStack{
            ChartView(chartData: ThisData, chartTitle: "Month Report")
        }
        .onAppear{Loopdate()}
        
    }
    
    func Loopdate(){
        let startday = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        var FnData: [DataItem] = []
        
        for number in 0...29{
            var daytotal = Foodinfos
                .filter(){
                    formatter.string(for: $0.timestamp) as! String == formatter.string(from: Date() - TimeInterval(86400 * number))
                }
                .map {(
                    
                    $0.protein * 4 / 0.25 +
                    $0.fatTotal * 9 / 0.25 +
                    $0.fatSaturated +
                    $0.fatTrans +
                    $0.carbohydrates  * 4 / 0.55 +
                    $0.sugars * 4 / 0.10 +
                    $0.sodium  * 1800 +
                    $0.fiber / 0.014
                )
                }.reduce(0, +)
            let calendarDate = Calendar.current.dateComponents([.day], from: Date() - TimeInterval(86400 * number))
            FnData.append(DataItem(name: "\(calendarDate.day ?? 0)" , value: daytotal))
        }
        ThisData = FnData
    }
}




//struct AnalysisListText: View {
//    let textlabel: String
//    let textvalue: Double
//    let todayvalue: Double
//
//
//    var body: some View {
//        HStack{
//            Text(textlabel)
//            Spacer()
//            Text("\(todayvalue, specifier: "%.1f") / \(textvalue, specifier: "%.1f") g")
//                .multilineTextAlignment(.trailing)
//        }
//    }
//}

struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
