//
//  ScanView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 26/5/2022.
//

import SwiftUI
import CoreML

struct ScanView: View {
    @State private var showScannerSheet = false
    @State private var texts:[ScanData] = []
    
    //ML
    let photo = "IMG_2939"
    @State private var classificationLabel: String = ""
    
    
    var body: some View {
        NavigationView{
            VStack{
                if texts.count > 0{
                    List{
                        ForEach(texts){text in
                            NavigationLink(
                                destination:ScrollView{Text(text.content)},
                                label: {
                                    Text(text.content).lineLimit(1)
                                })
                        }
                    }
                }
                else{
                    Text("No scan yet").font(.title)
                }
            }
            .navigationTitle("Scan OCR")
            .navigationBarItems(trailing: Button(action: {
                self.showScannerSheet = true
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
            })
                .sheet(isPresented: $showScannerSheet, content: {
                    self.makeScannerView()
                })
            )
        }
        //        VStack(spacing: 15) {
        ////        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        //
        //        Button {
        //            calculateBedtime()
        //        } label: {
        //            Text("Check Me")
        //        }
        //        Text(classificationLabel)
        //            .padding()
        //            .font(.body)
        //        }
    }
    
    private func makeScannerView()-> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines){
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
    
    func calculateBedtime() {
        do {
            guard let image = UIImage(named: photo),
                  let resizedImage = image.resizeImageTo(size:CGSize(width: 224, height: 224)),
                  let buffer = resizedImage.convertToBuffer() else {
                return
            }
            let output = try? LabelML().prediction(image: buffer)
            
            if let output = output {
                //                let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
                //                print("rer\(results)")
                //                let result = results.map { (key, value) in
                //                    return "\(key) = \(String(format: "%.2f", value * 100))%"
                //                }.joined(separator: "\n")
                //
                //                self.classificationLabel = result
                
                self.classificationLabel = output.classLabel
            }
            
            
        } catch {
            //            alertTitle = "Error"
            //            alertMessage = "Sorry, there was a problem."
        }
    }
}

struct ScanView_Previews: PreviewProvider {
    static var previews: some View {
        ScanView()
    }
}
