//
//  File.swift
//  FirstMovieApp
//
//  Created by Datdt on 01/11/2023.
//

import Foundation
import UIKit

struct GenresModel: Codable {
    var id: Int
    var name: String
}

struct GenresModelResponse: Codable {
    var genres: [GenresModel]
}
