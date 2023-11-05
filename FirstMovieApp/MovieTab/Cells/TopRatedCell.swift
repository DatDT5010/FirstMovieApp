//
//  TopRatedCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

class TopRatedCell: BaseCollectionViewCell {

    //MARK: UI Properties
    private let release: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.release
        label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSize)
        label.textColor = AppColors.grey
        return label
    }()
    
    private let topRatedDate: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSize)
        label.textColor = AppColors.black
        return label
    }()
    
    private let topRatedTitle: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont.systemFont(ofSize: AppFonts.mediumFontSize, weight: .medium)
        label.textColor = AppColors.black
        return label
    }()
    
    private let fiveStarImage: UIImageView = {
        let image = UIImageView(image: AppImages.fiveStars)
        return image
    }()
    
    private let topRatedRated: BaseLabel = {
        let label = BaseLabel()
        label.font = UIFont.systemFont(ofSize: AppFonts.smallFontSize)
        label.textColor = AppColors.grey
        return label
    }()
    
    private let topRatedImage: CachedImage = {
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
        initTopRatedDate()
        initTopRatedTitle()
        initFiveStarsImage()
        initTopRatedRated()
        initTopRatedImage()
    }
    
    //MARK: Setup Views
    private func initRelease() {
        contentView.addSubview(release)
        release.snp.makeConstraints { (make) in
            make.bottom.leading.equalToSuperview()
        }
    }
    
    private func initTopRatedDate() {
                contentView.addSubview(topRatedDate)
                topRatedDate.snp.makeConstraints { (make) in
                    make.bottom.equalToSuperview()
                    make.leading.equalTo(release.snp.trailing).offset(AppDimentions.shared.tinyMargin)
                }
            }
    
    private func initTopRatedTitle() {
            contentView.addSubview(topRatedTitle)
            topRatedTitle.snp.makeConstraints { (make) in
                make.bottom.equalTo(release.snp.top).offset(-AppDimentions.shared.tinyMargin)
                make.leading.trailing.equalToSuperview()
            }
        }
    
    private func initFiveStarsImage() {
        contentView.addSubview(fiveStarImage)
        let widthStar = 70 * AppDimentions.shared.widthScale
        let heightStar = 14 * AppDimentions.shared.heightScale
        fiveStarImage.snp.makeConstraints { (make) in
            make.bottom.equalTo(topRatedTitle.snp.top).offset(-AppDimentions.shared.tinyMargin)
            make.leading.equalToSuperview()
            make.width.equalTo(widthStar)
            make.height.equalTo(heightStar)
        }
    }
    
    private func initTopRatedRated() {
            contentView.addSubview(topRatedRated)
            topRatedRated.snp.makeConstraints { (make) in
                make.leading.equalTo(fiveStarImage.snp.trailing).offset(AppDimentions.shared.tinyMargin)
                make.bottom.equalTo(topRatedTitle.snp.top).offset(-AppDimentions.shared.superTinyMargin)
            }
        }
    
    private func initTopRatedImage() {
        contentView.addSubview(topRatedImage)
        topRatedImage.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(fiveStarImage.snp.top).offset(-AppDimentions.shared.smallMargin)
            make.top.equalTo(contentView.snp.top)
        }
    }
    
    //MARK: UI Actions
    func configure(topRatedItem: TopRatedModel) {
        let fullUrl = SupportLoadImage.getFullImageUrl(topRatedItem.poster_path)
        topRatedImage.loadImageUrl(urlString: fullUrl)
        topRatedTitle.text = topRatedItem.title
        topRatedRated.text = String(format: "%.1f", topRatedItem.vote_average / 2.0)
        topRatedDate.text = DateFormatter.string(iso: topRatedItem.release_date)
    }
}
