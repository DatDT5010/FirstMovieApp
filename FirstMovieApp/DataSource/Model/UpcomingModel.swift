//
//  UpcomingModul.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

struct UpcomingModel: Codable {
    var title: String
    var backdrop_path: String
    var release_date: String
}

struct UpcomingModelResponse: Codable {
    var results: [UpcomingModel]
}
