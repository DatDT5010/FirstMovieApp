//
//  BaseLabel.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

public class BaseLabel: UILabel {
    
    init() {
        super.init(frame: .zero)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

