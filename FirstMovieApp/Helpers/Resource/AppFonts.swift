//
//  AppFonts.swift
//  FirstMovieApp
//
//  Created by Datdt on 30/10/2023.
//

import Foundation
import UIKit

struct AppFonts {
    
    static func defaultFont(ofSize fontSize: CGFloat, weight: UIFont.Weight = .regular) -> UIFont {
        return UIFont.systemFont(ofSize: fontSize, weight: weight)
    }
    
    //MARK: FontSize
    static var tinyFontSize: CGFloat {
        return 12 * AppDimentions.shared.heightScale
    }
    static var smallFontSize: CGFloat {
        return 14 * AppDimentions.shared.heightScale
    }
    static var mediumFontSize: CGFloat {
        return 16 * AppDimentions.shared.heightScale
    }
    static var bigFontSize: CGFloat {
        return 14 * AppDimentions.shared.heightScale
    }
    static var giantFontSize: CGFloat {
        return 16 * AppDimentions.shared.heightScale
    }
    
    //FontSizeHeader
    static var tinyFontSizeHeader: CGFloat {
        return 18 * AppDimentions.shared.heightScale
    }
    static var smallFontSizeHeader: CGFloat {
        return 20 * AppDimentions.shared.heightScale
    }
    static var mediumFontSizeHeader: CGFloat {
        return 22 * AppDimentions.shared.heightScale
    }
    static var bigFontSizeHeader: CGFloat {
        return 24 * AppDimentions.shared.heightScale
    }
    
    
}
