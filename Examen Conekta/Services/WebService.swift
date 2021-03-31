//
//  WebService.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import Foundation

class WebService{
    
    func getPosts(url: URL, completion: @escaping ([Post]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                do{
                    let postsList = try JSONDecoder().decode(Posts.self, from: data)
                    completion(postsList.posts)
                }catch{
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
}
