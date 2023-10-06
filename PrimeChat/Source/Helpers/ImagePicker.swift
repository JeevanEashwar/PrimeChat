//
//  ImagePicker.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 05/10/23.
//

import SwiftUI

enum ImageType {
    case DisplayPicture
    case Status
}
struct ImagePicker: UIViewControllerRepresentable {
    
    @Binding var selectedImageUrl: URL?
    var imageType: ImageType
    @Environment(\.presentationMode) private var presentationMode

    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker

        init(parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let selectedImage = info[.originalImage] as? UIImage {
                AppManager.uploadImageToFirebaseStorage(image: selectedImage, imageType: self.parent.imageType) { result in
                    switch result {
                    case .success(let success):
                        AppManager.saveImageURL(photoUrl: success, imageType: self.parent.imageType)
                        DispatchQueue.main.async {
                            self.parent.selectedImageUrl = success
                        }
                    case .failure:
                        DispatchQueue.main.async {
                            self.parent.selectedImageUrl = nil
                        }
                    }
                }
                
            }
            parent.presentationMode.wrappedValue.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            parent.presentationMode.wrappedValue.dismiss()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
}

