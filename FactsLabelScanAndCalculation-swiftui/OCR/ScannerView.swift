//
//  ScannerView.swift
//  FactsLabelScanAndCalculation-swiftui
//
//  Created by kenkan on 27/5/2022.
//

import VisionKit
import SwiftUI

struct ScannerView: UIViewControllerRepresentable {
    
    @AppStorage("labeltype") var labeltype = ""
    private let completionHandler: ([String]?) -> Void
     
    init(completion: @escaping ([String]?) -> Void) {
        self.completionHandler = completion
    }
     
    typealias UIViewControllerType = VNDocumentCameraViewController
     
    func makeUIViewController(context: UIViewControllerRepresentableContext<ScannerView>) -> VNDocumentCameraViewController {
        let viewController = VNDocumentCameraViewController()
        viewController.delegate = context.coordinator
        return viewController
    }
     
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: UIViewControllerRepresentableContext<ScannerView>) {}
     
    func makeCoordinator() -> Coordinator {
        return Coordinator(completion: completionHandler)
    }
     
    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        private let completionHandler: ([String]?) -> Void
         
        init(completion: @escaping ([String]?) -> Void) {
            self.completionHandler = completion
        }
         
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            print("Document camera view controller did finish with ", scan)
//            return scan
//            print(completionHandler)
//            Checkthefoto(scan)
            let recognizer = TextRecognizer(cameraScan: scan)
            recognizer.recognizeText(withCompletionHandler: completionHandler)
        }
         
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            completionHandler(nil)
        }
         
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            print("Document camera view controller did finish with error ", error)
            completionHandler(nil)
        }
    }
    
//    func Checkthefoto() {
//        let photo=""
//        do {
//            guard let image = UIImage(named: photo),
//                  let resizedImage = image.resizeImageTo(size:CGSize(width: 224, height: 224)),
//                  let buffer = resizedImage.convertToBuffer() else {
//                return
//            }
//            let output = try? LabelML().prediction(image: buffer)
//            
//            if let output = output {
//                let results = output.classLabelProbs.sorted { $0.1 > $1.1 }
//                //                                print("rer\(results)")
//                let result = results.map { (key, value) in
//                    return "\(key) = \(String(format: "%.2f", value * 100))%"
//                }.joined(separator: "\n")
//                
//                print(result)
//                
//                labeltype = result
//                
//                // self.classificationLabel = output.classLabel
//            }
//            
//            
//        } catch {
//            //            alertTitle = "Error"
//            //            alertMessage = "Sorry, there was a problem."
//        }
//    }
}
