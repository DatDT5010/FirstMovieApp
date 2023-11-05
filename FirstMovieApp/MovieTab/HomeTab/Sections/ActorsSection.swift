//
//  ActorsSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 03/11/2023.
//

import UIKit

class ActorsSection: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private var actorsCollectionView: UICollectionView!
    
    public var listItem: [ActorsModel] = []
    
    private let actorHeader: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.actors
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
    
    private let actorsCollectionViewlayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = AppDimentions.shared.mediumMargin
        return layout
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        pushDataUpcoming()
        initActorsHeader()
        initViewAll()
        initActorsCollectionView()
    }
    
    //MARK: Setup Views
    private func initActorsCollectionView() {
        //contentView.backgroundColor = AppColors.backgroundColor
        actorsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: actorsCollectionViewlayout)
        actorsCollectionView.register(ActorsCell.self, forCellWithReuseIdentifier: ActorsCell.className)
        actorsCollectionView.dataSource = self
        actorsCollectionView.delegate = self
        actorsCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(actorsCollectionView)
        actorsCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(actorHeader.snp.bottom).offset(AppDimentions.shared.mediumMargin)
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
            make.bottom.trailing.equalToSuperview()
        }
    }
    
    private func initActorsHeader() {
        contentView.addSubview(actorHeader)
        actorHeader.snp.makeConstraints { (make) in
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
        ActorsNetworkManager.shared.getAllMovies { results in
            DispatchQueue.main.async {
                self.listItem = results
                self.actorsCollectionView.reloadData()
            }
        }
    }
}

extension ActorsSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding = AppDimentions.shared.mediumMargin
        let height = (actorsCollectionView.frame.height - padding) / 2.0
        let width = (actorsCollectionView.frame.width - padding * 4) / 4.0
        return CGSize(width: width, height: height)
        
    }
}

extension ActorsSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorsCell.className, for: indexPath) as! ActorsCell
        cell.configure(actorsItem: listItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
}
