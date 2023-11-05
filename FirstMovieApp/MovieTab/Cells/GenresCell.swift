//
//  GenresCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

import UIKit

class GenresCell: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private let genresImage: CachedImage = {
        let image = CachedImage()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        return image
    }()
    
    private let genresName: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont.systemFont(ofSize: AppFonts.bigFontSize, weight: .medium)
        label.textColor = AppColors.backgroundColor
        return label
    }()
    
    private let overlayBlack: UIImageView = {
        let image = UIImageView(image: AppImages.overlayBlack)
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        return image
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initGenresImage()
        initOverlayBlack()
        initGenresName()
    }
    
    //MARK: Setup Views
    private func initGenresImage() {
        contentView.addSubview(genresImage)
        genresImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func initGenresName() {
        contentView.addSubview(genresName)
        genresName.snp.makeConstraints { (make) in
            make.top.equalTo(contentView.snp.top).offset(AppDimentions.shared.smallMargin)
            make.centerX.equalToSuperview()
        }
    }
    
    private func initOverlayBlack() {
        contentView.addSubview(overlayBlack)
        overlayBlack.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    //MARK: UI Actions
    func configure(genresItem: GenresModel) {
        genresName.text = genresItem.name
        genresImage.image = GenresUtils.getGenresImage(id: genresItem.id)
    }
    
}

