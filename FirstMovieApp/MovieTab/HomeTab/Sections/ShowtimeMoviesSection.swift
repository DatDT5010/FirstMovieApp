//
//  ShowTimeMoviesSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 04/11/2023.
//

import UIKit

class ShowtimeMoviesSection: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private var showtimeMoviesCollectionView: UICollectionView!

    private let showtimeHeader: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.showTime
        label.font = UIFont.systemFont(ofSize: AppFonts.mediumFontSizeHeader, weight: .semibold)
        label.textColor = AppColors.black
        return label
    }()
    
    private let showtimeMoviesCollectionViewlayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = AppDimentions.shared.mediumMargin
        return layout
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        initShowtimeHeader()
        initShowtimeMoviesCollectionView()
    }
    
    //MARK: Setup Views
    private func initShowtimeMoviesCollectionView() {
        showtimeMoviesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: showtimeMoviesCollectionViewlayout)
        showtimeMoviesCollectionView.register(ShowtimeMoviesCell.self, forCellWithReuseIdentifier: ShowtimeMoviesCell.className)
        showtimeMoviesCollectionView.dataSource = self
        showtimeMoviesCollectionView.delegate = self
        showtimeMoviesCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(showtimeMoviesCollectionView)
        showtimeMoviesCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(showtimeHeader.snp.bottom).offset(AppDimentions.shared.mediumMargin)
            make.leading.trailing.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
            make.bottom.equalToSuperview().offset(-AppDimentions.shared.giantMargin)
        }
    }
    
    private func initShowtimeHeader() {
        contentView.addSubview(showtimeHeader)
        showtimeHeader.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
        }
    }
}

extension ShowtimeMoviesSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: showtimeMoviesCollectionView.frame.width - AppDimentions.shared.mediumMargin * 2, height: showtimeMoviesCollectionView.frame.height)

    }
}

extension ShowtimeMoviesSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowtimeMoviesCell.className, for: indexPath) as! ShowtimeMoviesCell
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
}
