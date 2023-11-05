//
//  ActorsCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 03/11/2023.
//

import UIKit

class ActorsCell: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private let actorsImage: CachedImage = {
        let image = CachedImage()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        return image
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initActorsImage()
    }
    
    //MARK: Setup Views
    private func initActorsImage() {
        contentView.addSubview(actorsImage)
        actorsImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            //make.width.equalToSuperview()
        }
    }
    
    //MARK: UI Actions
    func configure(actorsItem: ActorsModel) {
        let fullUrl = SupportLoadImage.getFullImageUrl(actorsItem.profile_path)
        actorsImage.loadImageUrl(urlString: fullUrl)
    }
}

