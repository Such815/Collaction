//
//  UserManager.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-17.
//

import Foundation
import Firebase

struct CurrentUser {
    static let userID = (FirebaseAuth.Auth.auth().currentUser?.uid)
    static let userEmail = (FirebaseAuth.Auth.auth().currentUser?.email)
}
