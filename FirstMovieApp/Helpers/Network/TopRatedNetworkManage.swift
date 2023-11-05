//
//  TopRatedNetworkManage.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

import Foundation
import Alamofire

class TopRatedNetworkManager {
    
    static let shared = TopRatedNetworkManager()
    
    var url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=63cbd7bb8ca53a31817a418b2cfb7e6a")!
    
    func getAllMovies(completion: @escaping ([TopRatedModel]) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(TopRatedModelResponse.self, from: data)
                    completion(response.results)
                }
                catch (let error) {
                    print(error.localizedDescription)
                    print("Failed")
                }
            }
        }
        task.resume()
    }
}

