//
//  NSObject_Extensions.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return String(describing: self)
    }
}
