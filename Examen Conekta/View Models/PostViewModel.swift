//
//  PostViewModel.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import Foundation
import UIKit

struct PostListViewModel {
    let posts : [Post]
    
    var numberOfSections : Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int{
        return self.posts.count
    }
    
    func postAtIndex(_ index: Int) -> PostViewModel{
        let post = self.posts[index]
        return PostViewModel(post)
    }
}

struct PostViewModel{
    private let post : Post
    
    var userId: Int{
        return self.post.userId
    }
    var id: Int{
        return self.post.id
    }
    var title: String{
        return self.post.title
    }
    var body: String {
        return self.post.body
    }
    var cornerRadius : CGFloat{
        return 10
    }
    
    init(_ post : Post) {
        self.post = post
    }
}
