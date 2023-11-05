//
//  GenresUtils.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

import UIKit

struct GenresUtils {
    static func getGenresImage(id: Int) -> UIImage {
        switch id {
        case 28:
            return UIImage(named: "genres_action")!
        case 12:
            return UIImage(named: "genres_adventure")!
        case 16:
            return UIImage(named: "genres_animation")!
        case 35:
            return UIImage(named: "genres_comedy")!
        case 80:
            return UIImage(named: "genres_crime")!
        case 99:
            return UIImage(named: "genres_documentary")!
        case 18:
            return UIImage(named: "genres_drama")!
        case 10751:
            return UIImage(named: "genres_family")!
        case 14:
            return UIImage(named: "genres_fantasy")!
        case 36:
            return UIImage(named: "genres_history")!
        case 27:
            return UIImage(named: "genres_horror")!
        case 10402:
            return UIImage(named: "genres_music")!
        case 9648:
            return UIImage(named: "genres_mystery")!
        case 10749:
            return UIImage(named: "genres_romance")!
        case 878:
            return UIImage(named: "genres_scienceFiction")!
        case 10770:
            return UIImage(named: "genres_tvMovie")!
        case 53:
            return UIImage(named: "genres_thriller")!
        case 10752:
            return UIImage(named: "genres_war")!
        case 37:
            return UIImage(named: "genres_western")!
        default:
            return UIImage(named: "")!
        }
    }
}
