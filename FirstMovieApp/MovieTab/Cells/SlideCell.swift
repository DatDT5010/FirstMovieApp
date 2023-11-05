//
//  SlideCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 04/11/2023.
//

import UIKit

class SlideCell: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private let slideImage: CachedImage = {
        let image = CachedImage()
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private let overlayWhite: UIImageView = {
        let image = UIImageView(image: AppImages.overlayWhite)
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initSlideImage()
        initOverlayWhite()
    }
    
    //MARK: Setup Views
    private func initSlideImage() {
        contentView.addSubview(slideImage)
        slideImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            //make.width.equalToSuperview()
        }
    }
    
    private func initOverlayWhite() {
        contentView.addSubview(overlayWhite)
        overlayWhite.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: UI Actions
    func configure(slideItem: SlideModel) {
        let fullUrl = SupportLoadImage.getFullImageUrl(slideItem.poster_path)
        slideImage.loadImageUrl(urlString: fullUrl)
    }
}


