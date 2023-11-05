//
//  TopRatedSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

class TopRatedSection: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private var topRatedCollectionView: UICollectionView!
    
    public var listItem: [TopRatedModel] = []

    private let topRatedHeader: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.topRated
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
    
    private let topRatedCollectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = AppDimentions.shared.mediumMargin
        layout.scrollDirection = .horizontal
        return layout
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        pushDataTopRated()
        initTopRatedHeader()
        initViewAll()
        initTopRatedCollectionView()
    }
    
    //MARK: Setup Views
    private func initTopRatedHeader() {
        contentView.addSubview(topRatedHeader)
        topRatedHeader.snp.makeConstraints { (make) in
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
    
    private func initTopRatedCollectionView() {
        topRatedCollectionView = UICollectionView(frame: .zero, collectionViewLayout: topRatedCollectionViewLayout)
        topRatedCollectionView.register(TopRatedCell.self, forCellWithReuseIdentifier: TopRatedCell.className)
        topRatedCollectionView.dataSource = self
        topRatedCollectionView.delegate = self
        topRatedCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(topRatedCollectionView)
        topRatedCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(topRatedHeader.snp.bottom).offset(AppDimentions.shared.mediumMargin)
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
            make.bottom.trailing.equalToSuperview()
        }
    }
    
    //MARK: Get Data
    private func pushDataTopRated() {
        TopRatedNetworkManager.shared.getAllMovies { results in
            DispatchQueue.main.async {
                self.listItem = results
                self.topRatedCollectionView.reloadData()
            }
        }
    }
    
}

extension TopRatedSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let textHeight = getHeightMediumFont(ofSize: AppFonts.mediumFontSize)
        //let padding =
        let width = (topRatedCollectionView.frame.height - textHeight * 3 - AppDimentions.shared.smallMargin * 3.0) * RatioConstants.portraintImage
        return CGSize(width: width,height: topRatedCollectionView.frame.height)
    }
}

extension TopRatedSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRatedCell.className, for: indexPath) as! TopRatedCell
            cell.configure(topRatedItem: listItem[indexPath.row])
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }

}
