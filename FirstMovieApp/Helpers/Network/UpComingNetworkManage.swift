//
//  UpComingNetworking.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

import Foundation
import Alamofire

class UpcomingNetworkManager {
    
    static let shared = UpcomingNetworkManager()
    
    var url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=63cbd7bb8ca53a31817a418b2cfb7e6a")!
    
    func getAllMovies(completion: @escaping ([UpcomingModel]) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, err in
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(UpcomingModelResponse.self, from: data)
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


