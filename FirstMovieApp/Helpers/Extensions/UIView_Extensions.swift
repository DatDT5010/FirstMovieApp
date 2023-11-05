//
//  UIView_Extensions.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import Foundation
import UIKit

extension UIView {
    
    func getHeightMediumFont(ofSize fontSize: CGFloat) -> CGFloat {
        return AppFonts.defaultFont(ofSize: fontSize).lineHeight
    }
    
}
