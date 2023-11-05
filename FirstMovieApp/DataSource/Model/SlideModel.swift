//
//  SliderModel.swift
//  FirstMovieApp
//
//  Created by Datdt on 04/11/2023.
//

import Foundation

struct SlideModel: Codable {
    var poster_path: String
}

struct SlideModelResponse: Codable {
    var results: [SlideModel]
}
