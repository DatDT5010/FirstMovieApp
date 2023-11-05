//
//  showtimeMoviesCell.swift
//  FirstMovieApp
//
//  Created by Datdt on 04/11/2023.
//

import UIKit

class ShowtimeMoviesCell: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private let mapImage: UIImageView = {
        let image = UIImageView(image: AppImages.map)
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = AppDimentions.shared.defaultRadius
        image.clipsToBounds = true
        return image
    }()
    
    private let searchCinema: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.searchTextField.attributedPlaceholder = NSAttributedString(string: "Search...", attributes: [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xC3DFAA)])
        search.layer.cornerRadius = AppDimentions.shared.defaultRadius
        search.searchTextField.font = UIFont.systemFont(ofSize: AppFonts.giantFontSize)
        search.searchTextField.backgroundColor = AppColors.backgroundColor
        search.searchTextField.leftView?.tintColor = AppColors.green
        search.layer.borderColor = AppColors.green.cgColor
        search.layer.borderWidth = 1.5
        return search
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initMapImage()
        initSearchCinema()
    }
    
    //MARK: Setup Views
    private func initMapImage() {
        contentView.addSubview(mapImage)
        mapImage.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    private func initSearchCinema() {
        contentView.addSubview(searchCinema)
        searchCinema.tintColor = AppColors.green
        let widthSearch = 120 * AppDimentions.shared.widthScale
        let heightSearch = 45 * AppDimentions.shared.heightScale
        searchCinema.snp.makeConstraints { (make) in
            make.width.equalTo(widthSearch)
            make.height.equalTo(heightSearch)

            make.leading.equalTo(AppDimentions.shared.mediumMargin)
            make.bottom.equalTo(-AppDimentions.shared.mediumMargin)

        }
    }
}


