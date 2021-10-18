//
//  PostModel.swift
//  Collaction
//
//  Created by Suchira  on 2021-10-18.
//

import Foundation

struct Post: Identifiable {
    var id: String = UUID().uuidString
    var author: String
    var caption: String
    var postURL: String
}
