//
//  PostsViewModel.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-18.
//

import Foundation
import FirebaseFirestore

class PostsViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    private var db = Firestore.firestore()
    
    func fetchData() {
        db.collection("posts").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No Documents In Collection")
                return
            }
            
            self.posts = documents.map { (queryDocumentSnapshot) -> Post in
                let data = queryDocumentSnapshot.data()
                
                let author = data["author"] as? String ?? ""
                let caption = data["caption"] as? String ?? ""
                let postURL = data["postURL"] as? String ?? ""
                
                return Post(author: author, caption: caption, postURL: postURL)
            }
        }
    }
}
