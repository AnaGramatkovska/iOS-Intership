//
//  ImagePicker.swift
//  CustomRegistrationApp
//
//  Created by Ana Gramatkovska on 31.1.23.
//

import Foundation
import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {

    @Binding var selectedImage: UIImage
    @Environment(\.presentationMode) private var presentationMode


    var sourceType: UIImagePickerController.SourceType = .photoLibrary

    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) ->
        UIImagePickerController {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = sourceType
            imagePicker.delegate = context.coordinator

            return imagePicker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        //alone
    }

    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
        var parent: ImagePicker
        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info [UIImagePickerController.InfoKey.originalImage] as? UIImage{
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }


    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

}
//import Foundation
//import SwiftUI
//
//struct ImagePicker : UIViewControllerRepresentable {
//
//    @Binding var picker : Bool
//    @Binding var imagedata : Data
//
//    func makeCoordinator() -> ImagePicker.Coordinator {
//
//        return ImagePicker.Coordinator(parent1: self)
//    }
//
//    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
//
//        let picker = UIImagePickerController()
//        picker.sourceType = .photoLibrary
//        picker.delegate = context.coordinator
//        return picker
//    }
//
//    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
//
//
//    }
//
//    class Coordinator : NSObject,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
//
//        var parent : ImagePicker
//
//        init(parent1 : ImagePicker) {
//
//            parent = parent1
//        }
//
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//
//            self.parent.picker.toggle()
//        }
//
//        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//
//
//            let image = info[.originalImage] as! UIImage
//
//            let data = image.jpegData(compressionQuality: 0.45)
//
//            self.parent.imagedata = data!
//
//            self.parent.picker.toggle()
//        }
//    }
//}
//
//struct Indicator : UIViewRepresentable {
//
//    func makeUIView(context: UIViewRepresentableContext<Indicator>) -> UIActivityIndicatorView {
//
//        let indicator = UIActivityIndicatorView(style: .large)
//        indicator.startAnimating()
//        return indicator
//    }
//
//    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<Indicator>) {
//
//
//    }
//}
