//
//  UploadImage.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-20.
//

import Foundation
import FirebaseStorage

func uploadImage(title: String, imageData: Data, path: String, completion: @escaping (String) -> ()) {
    
    let storage = Storage.storage().reference()
    let uid = CurrentUser.userEmail ?? ""
    
    storage.child(path).child(uid).child(title).putData(imageData, metadata: nil) { (_, err) in
        if err != nil {
            completion("")
            return
        }
        
        storage.child(path).child(uid).child(title).downloadURL { url, err in
            if err != nil {
                completion("")
                return
            }
            
            completion("\(url)")
        }
    }
}
