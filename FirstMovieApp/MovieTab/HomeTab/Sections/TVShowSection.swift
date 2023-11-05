//
//  TVShowSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 01/11/2023.
//

import UIKit

class TVShowSection: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private let tvShowHeader: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.tvShows
        label.font = UIFont.systemFont(ofSize: AppFonts.mediumFontSizeHeader, weight: .semibold)
        label.textColor = AppColors.black
        return label
    }()
    
    private var tvShowCollectionView: UICollectionView!
    
    let discover = TVShowModel(tvShowImage: "greenImg", tvShowTitle: "Discorver")
    let topPopular = TVShowModel(tvShowImage: "orangeImg", tvShowTitle: "Top Popular")
    let topRated = TVShowModel(tvShowImage: "orangeImg", tvShowTitle: "Top Rated")
    let onTheAir = TVShowModel(tvShowImage: "greenImg", tvShowTitle: "On The Air")

    var listItem: [TVShowModel] = []
    
    private let tvShowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = AppDimentions.shared.mediumMargin
        layout.minimumInteritemSpacing = AppDimentions.shared.mediumMargin
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        listItem = [discover, topPopular, topRated, onTheAir]
        
        initTVShowHeader()
        initTVShowCollectionView()
    }
    
    //MARK: Setup Views
    private func initTVShowHeader() {
        contentView.addSubview(tvShowHeader)
        tvShowHeader.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
        }
    }
    
    private func initTVShowCollectionView() {
        tvShowCollectionView = UICollectionView(frame: .zero, collectionViewLayout: tvShowLayout)
        tvShowCollectionView.register(TVShowCell.self, forCellWithReuseIdentifier: TVShowCell.className)
        tvShowCollectionView.delegate = self
        tvShowCollectionView.dataSource = self
        contentView.addSubview(tvShowCollectionView)
        tvShowCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(tvShowHeader.snp.bottom).offset(AppDimentions.shared.mediumMargin)
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
            make.bottom.trailing.equalToSuperview()
        }
        print(tvShowCollectionView.frame.height)
    }
    
    
}

extension TVShowSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (tvShowCollectionView.frame.width - AppDimentions.shared.mediumMargin * 2.0) / 2.0
        let height = (tvShowCollectionView.frame.height - AppDimentions.shared.mediumMargin * 1.1) / 2.0
        return CGSize(width: width, height: height)
    }
}

extension TVShowSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVShowCell.className, for: indexPath) as! TVShowCell
            cell.configure(tvShowItem: listItem[indexPath.row])
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
}
