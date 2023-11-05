//
//  UpcomingSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 02/11/2023.
//

import UIKit

class UpcomingSection: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private var upcomingCollectionView: UICollectionView!
    
    public var listItem: [UpcomingModel] = []
    
    private let upcomingHeader: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.upcoming
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
    
    private let upcomingCollectionViewlayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = AppDimentions.shared.mediumMargin
        return layout
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        pushDataUpcoming()
        initUpcomingHeader()
        initViewAll()
        initUpcomingCollectionView()
    }
    
    //MARK: Setup Views
    private func initUpcomingCollectionView() {
        //contentView.backgroundColor = AppColors.backgroundColor
        upcomingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: upcomingCollectionViewlayout)
        upcomingCollectionView.register(UpcomingCell.self, forCellWithReuseIdentifier: UpcomingCell.className)
        upcomingCollectionView.dataSource = self
        upcomingCollectionView.delegate = self
        upcomingCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(upcomingCollectionView)
        upcomingCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(upcomingHeader.snp.bottom).offset(AppDimentions.shared.mediumMargin)
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
            make.bottom.trailing.equalToSuperview()
        }
    }
    
    private func initUpcomingHeader() {
        contentView.addSubview(upcomingHeader)
        upcomingHeader.snp.makeConstraints { (make) in
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
    private func pushDataUpcoming() {
        UpcomingNetworkManager.shared.getAllMovies { results in
            DispatchQueue.main.async {
                self.listItem = results
                self.upcomingCollectionView.reloadData()
            }
        }
    }
}

extension UpcomingSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = upcomingCollectionView.frame.width * 0.75
        return CGSize(width: width, height: width / RatioConstants.lanscapeImage)
        
    }
}

extension UpcomingSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingCell.className, for: indexPath) as! UpcomingCell
        cell.configure(upcomingItem: listItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
}

