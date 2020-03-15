//
//  NetworkManager.swift
//  swift-hackernews-intermediate
//
//  Created by Bojun Jin on 7/03/20.
//  Copyright © 2020 Bojun Jin. All rights reserved.
//

import Foundation


class NetworkManager : ObservableObject {
    
    @Published var posts = [Post]()
    
    func fecthData() {
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page"){
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, repo, error) in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                        } catch{
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
