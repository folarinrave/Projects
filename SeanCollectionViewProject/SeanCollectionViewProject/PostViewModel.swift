//
//  PostViewModel.swift
//  SeanCollectionViewProject
//
//  Created by Sean Jones on 10/20/21.
//

import Foundation


class PostViewModel {
    
    
    var posts: [Post]? {
        didSet {
            print("new posts")
            DispatchQueue.main.async {
                self.closure()
            }
           
            
            
        }
    }
    var closure: () -> Void = {
        
    }
    
     init() {
        fetchPosts() { ( result) in
            switch result {
            case .success (let posts):
                self.posts = posts
            case . failure(let error):
                print(error.localizedDescription)
                
            }
        }
    }
    
    let baseURL = URL(string: "https://www.reddit.com/r/tifu")
    let jsonExtension: String = "json"
    
    func fetchPosts(completion: @escaping (Result<[Post], PostError>) -> Void){
        guard let baseURL = baseURL else {return completion(.failure(.invalidURL))}
        let finalURL = baseURL.appendingPathExtension(jsonExtension)
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error{
                
            }
            guard let data = data else {return completion(.failure(.noData))}
            do{
                let decoder = JSONDecoder()
                let topLevelObject = try decoder.decode( TopLevelObject.self, from: data)
                let secondLevelObject = topLevelObject.data
                let thirdLevelObjects = secondLevelObject.children
                
                var placeholderArray: [Post] = []
                
                for object in thirdLevelObjects {
                    placeholderArray.append(object.data)
                }
                
                return completion(.success(placeholderArray))
            }
            catch{
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
        }.resume()
    }
    
}
