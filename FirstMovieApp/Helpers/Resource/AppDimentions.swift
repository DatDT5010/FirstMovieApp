//
//  AppDimention.swift
//  FirstMovieApp
//
//  Created by Datdt on 30/10/2023.
//

import UIKit

public class AppDimentions {
    
    public static let shared = AppDimentions()
    
    var widthScale: CGFloat = 1.0
    var heightScale:CGFloat = 1.0
    
    private init() {
        let widthIP11: CGFloat = 414
        let heightIP11: CGFloat = 896
        
        widthScale = UIScreen.main.bounds.width / widthIP11
        heightScale = UIScreen.main.bounds.height / heightIP11
    }
    
    //MARK: Spacing
    
    var superTinyMargin: CGFloat {
        return 2 * widthScale
    }
    var tinyMargin: CGFloat {
        return 4 * widthScale
    }
    var smallMargin: CGFloat {
        return 8 * widthScale
    }
    var mediumMargin: CGFloat {
        return 13 * widthScale
    }
    var bigMargin: CGFloat {
        return 16 * widthScale
    }
    var giantMargin: CGFloat {
        return 20 * widthScale
    }
    
    var mediumMarginSection: CGFloat {
        return 35 * widthScale
    }
    
    
    //MARK: Radius
    var defaultRadius: CGFloat {
        return 10
    }
    var bigRadius: CGFloat {
        return 20
    }
    var giantRadius: CGFloat {
        return 30
    }
    
    
    //MARK: Section
    
    var slideHeight: CGFloat {
        return 480 * AppDimentions.shared.heightScale
    }
    var genresHeight: CGFloat {
        return 180 * AppDimentions.shared.heightScale
    }
    var tvShowHeight: CGFloat {
        return 220 * AppDimentions.shared.heightScale
    }
    var popularHeight: CGFloat {
        return 320 * AppDimentions.shared.heightScale
    }
    var topRatedHeight: CGFloat {
        return 340 * AppDimentions.shared.heightScale
    }
    var upcomingHeight: CGFloat {
        return 240 * AppDimentions.shared.heightScale
    }
    var actorsHeight: CGFloat {
        return 280 * AppDimentions.shared.heightScale
    }
    var showTimeMoviesHeight: CGFloat {
        return 280 * AppDimentions.shared.heightScale
    }
    
}
