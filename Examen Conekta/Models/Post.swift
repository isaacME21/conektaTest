//
//  Post.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import Foundation
struct Posts : Decodable {
    let posts : [Post]
}


struct Post : Decodable {
   let userId: Int
   let id: Int
   let title: String
   let body: String
}
