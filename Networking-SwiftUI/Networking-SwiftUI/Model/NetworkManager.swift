//
//  NetworkManager.swift
//  Networking-SwiftUI
//
//  Created by PavunRaj on 29/12/23.
//

import Foundation
import SwiftUI

class NetworkManager: ObservableObject {
    
    let baseWebURL =  "http://hn.algolia.com/api/v1/search?tags=front_page"
  //  @Published var posts: NewsModel?
    @Published var posts = [Post]()

    func fetchData() {
        
        if let url = URL(string: baseWebURL) {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .default)
            let task =  session.dataTask(with: request) { data, response, error in
                if let safeData = data {
                   // let result = self.parseJSON(safeData )
                    if let  resultModel = try? JSONDecoder().decode(Results.self, from: safeData) {
                        DispatchQueue.main.async {
                            self.posts = resultModel.hits

                        }
                    }
                  
                    
                } else {
                    print(error?.localizedDescription)
                }
            }
            task.resume()
            
        }
    }
    
    func parseJSON(_ data:Data) -> NewsModel? {
        let decode = JSONDecoder()
        var newsModel: NewsModel?
        
            if let  resultModel = try? decode.decode(Results.self, from: data) {
//                let hits = resultModel.hits
//
//                for i in 0..<(hits?.count ?? 0) {
//                    newsModel  = NewsModel(objectID: hits?[i].objectID ?? "", points: hits?[i].points ?? 0, title: hits?[i].title ?? "", url: hits?[i].url ?? "")
//                }
//                print("Total Count:",newsModel)
//
           }
        
        return newsModel


    }
}
