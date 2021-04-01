//
//  WebService.swift
//  Examen Conekta
//
//  Created by Luis Isaac Maya on 31/03/21.
//

import Foundation
import SwiftyJSON

enum HttpMethod : String{
    case post = "POST"
}

struct Resource <T: Codable> {
    let url : URL
    var httpMethod : HttpMethod = .post
    var body : Data? = nil
    
    init(url: URL){
        self.url = url
    }
    
}

class WebService{
    
    func getPosts<T>(resource : Resource<T>, completion: @escaping ([Post]?) -> ()){
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error{
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data{
                do{
                    let json = try JSON(data: data)
                    var postList : [Post] = []
                    postList.append(try JSONDecoder().decode(Post.self, from: json["0"].rawData()))
                    postList.append(try JSONDecoder().decode(Post.self, from: json["1"].rawData()))
                    postList.append(try JSONDecoder().decode(Post.self, from: json["2"].rawData()))
                    completion(postList)
                }catch{
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }.resume()
    }
}
