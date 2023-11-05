//
//  TVShowCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 01/11/2023.
//

import UIKit

class TVShowCell: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private var tvShowColorImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        return image
    }()
    
    private let tvShowTitle: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSizeHeader, weight: .medium)
        label.textColor = AppColors.backgroundColor
        return label
    }()
    
    private let arrowImage: UIImageView = {
        let img = UIImageView(image: AppImages.icArrow)
        return img
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initTVShowColorImage()
        initTVShowTitle()
        initArrowImage()
    }
    
    //MARK: Setup Views
    private func initTVShowColorImage() {
        contentView.addSubview(tvShowColorImage)
        tvShowColorImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func initTVShowTitle() {
        contentView.addSubview(tvShowTitle)
        tvShowTitle.snp.makeConstraints { (make) in
            make.leading.top.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
        }
    }
    
    private func initArrowImage() {
        contentView.addSubview(arrowImage)
        let widthArrow = 80 * AppDimentions.shared.widthScale
        let heightArrow = 10 * AppDimentions.shared.widthScale
        arrowImage.snp.makeConstraints { (make) in
            make.width.equalTo(widthArrow)
            make.height.equalTo(heightArrow)
            make.bottom.equalToSuperview().offset(-AppDimentions.shared.smallMargin)
            make.trailing.equalToSuperview().offset(-AppDimentions.shared.mediumMargin)
        }
    }
    
    //MARK: UI Actions
    func configure(tvShowItem: TVShowModel) {
        tvShowColorImage.image = UIImage(named: tvShowItem.tvShowImage)
        tvShowTitle.text = tvShowItem.tvShowTitle
    }
}
