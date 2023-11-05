//
//  PopularNetworkManage.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import Foundation
import Alamofire

class PopularNetworkManager {
    
    static let shared = PopularNetworkManager()
    
    var url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=63cbd7bb8ca53a31817a418b2cfb7e6a")!
    
    func getAllMovies(completion: @escaping ([PopularModel]) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(PopularModelResponse.self, from: data)
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

