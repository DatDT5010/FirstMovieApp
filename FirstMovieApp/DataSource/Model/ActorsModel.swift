//
//  ActorsModel.swift
//  FirstMovieApp
//
//  Created by Datdt on 03/11/2023.
//

import Foundation

struct ActorsModel: Codable {
    var profile_path: String
}

struct ActorsModelResponse: Codable {
    var results: [ActorsModel]
}
