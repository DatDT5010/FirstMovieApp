//
//  BaseCollectionViewCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initView()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func initView() {
        
    }
    
}
