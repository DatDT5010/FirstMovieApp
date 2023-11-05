//
//  Model.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import Foundation
import UIKit

struct PopularModel: Codable {
    var title: String
    var poster_path: String
    var release_date: String
}

struct PopularModelResponse: Codable {
    var results: [PopularModel]
}
