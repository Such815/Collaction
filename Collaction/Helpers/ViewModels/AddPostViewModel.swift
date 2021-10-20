//
//  AddPostViewModel.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-20.
//

import Foundation
import Firebase

class AddPostViewModel: ObservableObject {
    
    private var db = Firestore.firestore()
    @Published var post: Post = Post(author: "", caption: "", postURL: "")
    
    
}
