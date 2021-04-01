//
//  Post.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import Foundation
struct Post : Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
    
    static func createPost(vm: AddPostViewModel) -> Resource<Post?>{
        let post = Post(vm)
        let postArray = [post,post,post]
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("URL is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(postArray) else{
            fatalError("Error encoding post!")
        }
        
        var resource = Resource<Post?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
    }
    
    
    init?(_ vm: AddPostViewModel){
        self.userId = vm.userId
        self.id = vm.id
        self.title = vm.title
        self.body = vm.body
        
    }
}
