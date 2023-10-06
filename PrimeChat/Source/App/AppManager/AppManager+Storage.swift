//
//  AppManager+Storage.swift
//  PrimeChat
//
//  Created by Jeevan Eashwar on 05/10/23.
//

import Foundation
import UIKit
import FirebaseStorage

extension AppManager {
    
    static private var storageRef: StorageReference {
        Storage.storage().reference()
    }
    
    static private var userProfileImagesRef: StorageReference {
        storageRef.child("userProfileImages")
    }
    
    static private var statusCollectionRef: StorageReference {
        storageRef.child("statusImages")
    }
    
    static private var statusImageRef: StorageReference {
        statusCollectionRef.child("\(UUID().uuidString).jpg")
    }
    
    static private func imageRef(filename: String) -> StorageReference {
        userProfileImagesRef.child("\(filename).jpg")
    }
    
    static private var profileImageRef: StorageReference {
        if let username = currentUserEmail.components(separatedBy: "@").first {
            return imageRef(filename: username)
        } else {
            return imageRef(filename: currentUserEmail)
        }
    }
    
    static func uploadImageToFirebaseStorage(image: UIImage, imageType: ImageType, completion: @escaping (Result<URL, Error>) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
            return
        }
        
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"
        
        var ref: StorageReference
        switch imageType {
        case .DisplayPicture:
            ref = profileImageRef
        case .Status:
            ref = statusImageRef
        }
        
        ref.putData(imageData, metadata: metadata) { (metadata, error) in
            guard let _ = metadata else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to upload image"])))
                }
                return
            }
            
            ref.downloadURL { (url, error) in
                if let url = url {
                    completion(.success(url))
                } else {
                    if let error = error {
                        completion(.failure(error))
                    } else {
                        completion(.failure(NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Failed to get download URL"])))
                    }
                }
            }
        }
    }
    
    typealias ContactImageCompletionHandler = (_ url:URL?) -> Void
    static func contactImagePhotoUrl(fileName: String, completion: @escaping ContactImageCompletionHandler) {
        userProfileImagesRef.child("\(fileName).jpg")
            .downloadURL { url, _ in
                if let url = url {
                    completion(url)
                }
            }
    }
    
}
