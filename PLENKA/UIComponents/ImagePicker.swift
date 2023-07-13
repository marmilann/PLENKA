//
//  ImagePicker.swift
//  PLENKA
//
//  Created by Nariman on 26.06.2023.
//

import UIKit
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [String]
    @Binding var isPresented: Bool

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding var selectedImages: [String]
        @Binding var isPresented: Bool
        
        init(selectedImages: Binding<[String]>, isPresented: Binding<Bool>) {
            _selectedImages = selectedImages
            _isPresented = isPresented
        }
        
        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                if let imageData = selectedImage.jpegData(compressionQuality: 0.8) {
                    let imageString = imageData.base64EncodedString()
                    selectedImages.append(imageString)
                }
            }
            
            isPresented = false
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            isPresented = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(selectedImages: $selectedImages, isPresented: $isPresented)
    }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController,
                                context: UIViewControllerRepresentableContext<ImagePicker>) {
        // Нет необходимости в обновлении контроллера
    }
}
