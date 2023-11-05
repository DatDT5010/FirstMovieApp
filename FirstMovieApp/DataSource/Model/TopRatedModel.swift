//
//  TopRatedModel.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

import Foundation
import UIKit

struct TopRatedModel: Codable {
    var title: String
    var poster_path: String
    var release_date: String
    var vote_average: Float
}

struct TopRatedModelResponse: Codable {
    var results: [TopRatedModel]
}
