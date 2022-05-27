//
//  HistoryView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 22/5/2022.
//

import SwiftUI

struct HistoryView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.timestamp, order: .reverse),
    ]) var Foodinfos: FetchedResults<Foodinfo>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Foodinfos) {food in
                    NavigationLink {
                        FoodDetailView(food: food)
                    } label: {
                        HStack {
                            Text(food.foodName ?? "Unknown Title")
                            Spacer()
                            VStack{
                                Text(food.timestamp ?? Date() , style: .date)
                                Text(food.timestamp ?? Date() , style: .time)
                            }
                        }
                    }
                }
                .onDelete(perform: deleteFoods)
            }
            .navigationTitle("History")
        }
    }
    
    func deleteFoods(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let food = Foodinfos[offset]
            // delete it from the context
            moc.delete(food)
        }
        // save the context
        try? moc.save()
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
