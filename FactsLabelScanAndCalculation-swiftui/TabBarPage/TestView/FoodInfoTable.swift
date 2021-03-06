//
//  FoodInfoTable.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 26/5/2022.
//

import SwiftUI

struct FoodInfoTable: View {
    //OCR
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    
    //Form
    @Environment(\.managedObjectContext) var moc
    //    @Environment(\.dismiss) var dismiss
    @FocusState private var amountIsFocused: Bool
    
    @State private var foodName = ""
    
    @State private var protein = 0.0
    @State private var fatTotal = 0.0
    @State private var fatSaturated = 0.0
    @State private var fatTrans = 0.0
    
    
    @State private var carbohydrates = 0.0
    @State private var sugars = 0.0
    @State private var sodium = 0.0
    @State private var fiber = 0.0
    @State private var energy = 0.0
    
    
    @State private var persize = 1.0
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name of Food", text: $foodName)
                }
                
                Section {
                    HStack{
                        Text("Serving Size")
                        TextField("Size", value: $persize, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                }
                
                Section {
                    HStack{
                        Text("Protein")
                        TextField("Protein", value: $protein, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    HStack{
                        Text("Fat Total")
                        TextField("Fat Total", value: $fatTotal, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    HStack{
                        Text("Fat Saturated")
                        TextField("Fat Saturated", value: $fatSaturated, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    HStack{
                        Text("Fat Trans")
                        TextField("Fat Trans",value: $fatTrans, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    
                    HStack{
                        Text("Carbohydrates")
                        TextField("Carbohydrates", value: $carbohydrates, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    HStack{
                        Text("Sugars")
                        TextField("Sugars", value: $sugars, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    HStack{
                        Text("Sodium")
                        TextField("Sodium", value: $sodium, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    HStack{
                        Text("Fiber")
                        TextField("Fiber", value: $fiber, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                    HStack{
                        Text("Energy")
                        TextField("Energy", value: $energy, format: .number)
                            .multilineTextAlignment(.trailing)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                    }
                } header: {
                    Text("you food label")
                }
            }
            .navigationTitle("Add Food")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        SaveFood()
                    } label: {
                        Label("save", systemImage: "plus")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        self.showScannerSheet = true
                    } label: {
                        Image(systemName: "doc.text.viewfinder")
                            .font(.title)
                    }
                    .sheet(isPresented: $showScannerSheet, content: {
                        self.makeScannerView()
                    })
                }
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
            
            //                        .sheet(isPresented: $showingAddScreen) {
            //                            FoodInfoTable()
            //                        }
        }
        
    }
    
    private func makeScannerView()-> ScannerView {
        //        let cameraScan: VNDocumentCameraScan
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            print("this the text:____", texts)
            print("this the text0", texts[0].content)
            foodName = texts[0].content
            self.showScannerSheet = false
        })
    }
    
    func SaveFood(){
        let newFood = Foodinfo(context: moc)
        newFood.id = UUID()
        newFood.foodName = foodName
        
        newFood.protein = protein * persize
        newFood.fatTotal = fatTotal * persize
        newFood.fatSaturated = fatSaturated * persize
        newFood.fatTrans = fatTrans * persize
        
        newFood.carbohydrates = carbohydrates * persize
        newFood.sugars = sugars * persize
        newFood.sodium = sodium / 1000 * persize
        newFood.fiber = fiber * persize
        newFood.energy = energy * persize
        
        newFood.timestamp = Date.now
        
        try? moc.save()
        print("Your food saved")
    }
}

struct FoodInfoTable_Previews: PreviewProvider {
    static var previews: some View {
        FoodInfoTable()
    }
}
