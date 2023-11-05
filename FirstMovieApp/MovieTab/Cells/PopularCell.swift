//
//  PopularCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

class PopularCell: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private let popularImage: CachedImage = {
        let image = CachedImage()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        return image
    }()
    
    private let popularTitle: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont.systemFont(ofSize: AppFonts.mediumFontSize, weight: .medium)
        label.textColor = .black
        return label
    }()
    
    private let release: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.release
        label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSize)
        label.textColor = AppColors.grey
        return label
    }()
    
    private let popularDate: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSize)
        label.textColor = AppColors.black
        return label
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initRelease()
        initPopularDate()
        initPopularTitle()
        initPopularImage()
    }
    
    //MARK: Setup Views
    private func initRelease() {
        contentView.addSubview(release)
        release.snp.makeConstraints { (make) in
            make.bottom.leading.equalToSuperview()
        }
    }
    
    private func initPopularDate() {
        contentView.addSubview(popularDate)
        popularDate.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.leading.equalTo(release.snp.trailing).offset(AppDimentions.shared.tinyMargin)
        }
    }
    
    private func initPopularTitle() {
        contentView.addSubview(popularTitle)
        popularTitle.snp.makeConstraints { (make) in
            make.bottom.equalTo(release.snp.top).offset(-AppDimentions.shared.tinyMargin)
            make.leading.trailing.equalToSuperview()
        }
    }
    
    private func initPopularImage() {
        contentView.addSubview(popularImage)
        popularImage.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(popularTitle.snp.top).offset(-AppDimentions.shared.smallMargin)
            make.top.equalTo(contentView.snp.top)
            make.width.equalToSuperview()
        }
    }
    
    //MARK: UI Actions
    func configure(popularItem: PopularModel) {
        let fullUrl = SupportLoadImage.getFullImageUrl(popularItem.poster_path)
        popularImage.loadImageUrl(urlString: fullUrl)
        popularTitle.text = popularItem.title
        popularDate.text = DateFormatter.string(iso: popularItem.release_date)
    }
    
}
