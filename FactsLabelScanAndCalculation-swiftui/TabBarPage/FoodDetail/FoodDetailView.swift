//
//  FoodDetailView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 26/5/2022.
//

import SwiftUI
import CoreData

struct FoodDetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    @State private var showingDeleteAlert = false
    
    let food : Foodinfo
    
    var body: some View {
        List{
            Section (header: Text("Your Food")){
                Text(food.foodName ?? "Unknown Title")
                    .navigationTitle("Food Detail")
                
                HStack{
                    Text("Add Date")
                    Spacer()
                    Text(food.timestamp ?? Date() , style: .date)
                        .multilineTextAlignment(.trailing)
                }
            }
            
            Section (header: Text("Nutrition Facts Info")){
                DetailListText(textlabel: "Protein", textvalue: food.protein)
                DetailListText(textlabel: "Fat Total", textvalue: food.fatTotal)
                DetailListText(textlabel: "Fat Saturated", textvalue: food.fatSaturated)
                DetailListText(textlabel: "Fat Trans", textvalue: food.fatTrans)
                
                DetailListText(textlabel: "Carbohydrates", textvalue: food.carbohydrates)
                DetailListText(textlabel: "Sugars", textvalue: food.sugars)
                DetailListText(textlabel: "Sodium", textvalue: food.sodium)
                DetailListText(textlabel: "Fiber", textvalue: food.fiber)
                DetailListText(textlabel: "Energy", textvalue: food.energy)
                
                //                                DetailListText(textlabel: "Date", textvalue: food.timestamp)
                
            }
        }
        .navigationTitle(food.foodName ?? "Unknown Title")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Delete Food", isPresented: $showingDeleteAlert) {
            Button("Delete", role: .destructive, action: deleteFood)
            Button("Cancel", role: .cancel) { }
        } message: {
            Text("Are you sure?")
        }
        .toolbar {
            Button {
                showingDeleteAlert = true
            } label: {
                Label("Delete this Food", systemImage: "trash")
            }
        }
    }
    func deleteFood() {
        moc.delete(food)
        dismiss()
    }
}

struct DetailListText: View {
    let textlabel: String
    let textvalue: Double
    
    var body: some View {
        HStack{
            Text(textlabel)
            Spacer()
            Text("\(textvalue, specifier: "%.1f")")
                .multilineTextAlignment(.trailing)
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    
    static var previews: some View {
        let food = Foodinfo(context: moc)
        food.foodName = "aa"
        food.protein = 1.0
        food.fatTotal = 1.0
        food.fatSaturated = 1.0
        food.fatTrans = 1.0
        
        food.carbohydrates = 1.0
        food.sugars = 1.0
        food.sodium = 1.0
        food.fiber = 1.0
        food.energy = 1.0
        
        
        return NavigationView {
            FoodDetailView(food: food)
        }
    }
}
