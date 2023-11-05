//
//  PopularSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

class PopularSection: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private var popularCollectionView: UICollectionView!
    
    public var listItem: [PopularModel] = []
    
    private let popularHeader: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.popular
        label.font = UIFont.systemFont(ofSize: AppFonts.mediumFontSizeHeader, weight: .semibold)
        label.textColor = AppColors.black
        return label
    }()
    
    private let viewAll: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.viewAll
        label.font = UIFont.systemFont(ofSize: AppFonts.tinyFontSizeHeader, weight: .semibold)
        label.textColor = AppColors.orange
        return label
    }()
    
    private let popularCollectionViewlayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = AppDimentions.shared.mediumMargin
        return layout
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        pushDataPopular()
        initPopularHeader()
        initViewAll()
        initPopularCollectionView()
    }
    
    //MARK: Setup Views
    private func initPopularCollectionView() {
        //contentView.backgroundColor = AppColors.backgroundColor
        popularCollectionView = UICollectionView(frame: .zero, collectionViewLayout: popularCollectionViewlayout)
        popularCollectionView.register(PopularCell.self, forCellWithReuseIdentifier: PopularCell.className)
        popularCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.showsHorizontalScrollIndicator = false
        //contentView.backgroundColor = .blue
        contentView.addSubview(popularCollectionView)
        popularCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(popularHeader.snp.bottom).offset(AppDimentions.shared.mediumMargin)
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
            make.bottom.trailing.equalToSuperview()
        }
    }
    
    private func initPopularHeader() {
        contentView.addSubview(popularHeader)
        popularHeader.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
        }
    }
    
    private func initViewAll() {
        contentView.addSubview(viewAll)
        viewAll.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.trailing.equalToSuperview().offset(-AppDimentions.shared.mediumMargin)
        }
    }
    
    //MARK: Get Data
    private func pushDataPopular() {
        PopularNetworkManager.shared.getAllMovies { results in
            DispatchQueue.main.async {
                self.listItem = results
                self.popularCollectionView.reloadData()
            }
        }
    }
}

extension PopularSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let textHeight = getHeightMediumFont(ofSize: AppFonts.mediumFontSize)
        let width = (popularCollectionView.frame.height - textHeight * 2 - AppDimentions.shared.smallMargin * 2) * RatioConstants.portraintImage
        return CGSize(width: width, height: popularCollectionView.frame.height)
        
    }
}

extension PopularSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCell.className, for: indexPath) as! PopularCell
        cell.configure(popularItem: listItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
}
