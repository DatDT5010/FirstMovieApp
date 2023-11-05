//
//  GenresSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 01/11/2023.
//

import UIKit

class GenresSection: BaseCollectionViewCell {
    
    //MARK: UI Properties
    private var genresCollectionView: UICollectionView!
    
    public var listItem: [GenresModel] = []
    
    private let genresHeader: BaseLabel = {
        let label = BaseLabel()
        label.text = AppStrings.genres
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
    
    private let genresCollectionViewlayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = AppDimentions.shared.mediumMargin
        return layout
    }()
    
    //MARK: Ui Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        pushDataGenres()
        initGenresHeader()
        initViewAll()
        initGenresCollectionView()
    }
    
    //MARK: Setup Views
    private func initGenresCollectionView() {
        genresCollectionView = UICollectionView(frame: .zero, collectionViewLayout: genresCollectionViewlayout)
        genresCollectionView.register(GenresCell.self, forCellWithReuseIdentifier: GenresCell.className)
        genresCollectionView.dataSource = self
        genresCollectionView.delegate = self
        genresCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(genresCollectionView)
        genresCollectionView.snp.makeConstraints { (make) in
            make.top.equalTo(genresHeader.snp.bottom).offset(AppDimentions.shared.mediumMargin)
            make.leading.equalToSuperview().offset(AppDimentions.shared.mediumMargin)
            make.bottom.trailing.equalToSuperview()
        }
    }
    
    private func initGenresHeader() {
        contentView.addSubview(genresHeader)
        genresHeader.snp.makeConstraints { (make) in
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
    private func pushDataGenres() {
        GenresNetworkManager.shared.getAllMovies { results in
            DispatchQueue.main.async {
                self.listItem = results
                self.genresCollectionView.reloadData()
            }
        }
    }
}

extension GenresSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = genresCollectionView.frame.height * RatioConstants.portraintImage
        return CGSize(width: width, height: genresCollectionView.frame.height)
        
    }
}

extension GenresSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresCell.className, for: indexPath) as! GenresCell
        cell.configure(genresItem: listItem[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
}
