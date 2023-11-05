//
//  UpcomingCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

import UIKit

class UpcomingCell: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private let release: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.release
        label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSize)
        label.textColor = AppColors.grey
        return label
    }()
    
    private let upcomingDate: BaseLabel = {
            let label = BaseLabel()
            label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSize)
            label.textColor = AppColors.black
            return label
        }()
    
    private let upcomingTitle: BaseLabel = {
            let label = BaseLabel()
            label.font = UIFont.systemFont(ofSize: AppFonts.mediumFontSize, weight: .medium)
            label.textColor = .black
            return label
        }()
    
    private let upcomingImage: CachedImage = {
        let image = CachedImage()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        return image
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initRelease()
        initUpcomingDate()
        initUpcomingTitle()
        initUpcomingImage()
    }
    
    //MARK: Setup Views
    private func initRelease() {
        contentView.addSubview(release)
        release.snp.makeConstraints { (make) in
            make.bottom.leading.equalToSuperview()
        }
    }
    
    private func initUpcomingDate() {
            contentView.addSubview(upcomingDate)
            upcomingDate.snp.makeConstraints { (make) in
                make.bottom.equalToSuperview()
                make.leading.equalTo(release.snp.trailing).offset(AppDimentions.shared.tinyMargin)
            }
        }
    
    private func initUpcomingTitle() {
            contentView.addSubview(upcomingTitle)
            upcomingTitle.snp.makeConstraints { (make) in
                make.bottom.equalTo(release.snp.top).offset(-AppDimentions.shared.tinyMargin)
                make.leading.trailing.equalToSuperview()
            }
        }
    
    private func initUpcomingImage() {
        contentView.addSubview(upcomingImage)
        upcomingImage.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(upcomingTitle.snp.top).offset(-AppDimentions.shared.smallMargin)
            make.top.equalTo(contentView.snp.top)
            make.width.equalToSuperview()
        }
    }
    
    //MARK: UI Actions
    func configure(upcomingItem: UpcomingModel) {
        let fullUrl = SupportLoadImage.getFullImageUrl(upcomingItem.backdrop_path)
        upcomingImage.loadImageUrl(urlString: fullUrl)
        upcomingTitle.text = upcomingItem.title
        upcomingDate.text = DateFormatter.string(iso: upcomingItem.release_date)
    }
    
}

