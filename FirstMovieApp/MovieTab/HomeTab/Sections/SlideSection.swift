//
//  SlideSection.swift
//  FirstMovieApp
//
//  Created by Datdt on 04/11/2023.
//

import UIKit

class SlideSection: BaseCollectionViewCell {

    //MARK: UI Properties
    private var slideCollectionView: UICollectionView!
        
    public var listItem: [SlideModel] = []
    
    private let showtimesButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Showtimes", for: .normal)
        btn.setTitleColor(AppColors.backgroundColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: AppFonts.smallFontSizeHeader, weight: .medium)
        btn.setImage(AppImages.airplay, for: .normal)
        btn.backgroundColor = AppColors.orange
        btn.layer.cornerRadius = AppDimentions.shared.bigRadius
        //btn.configuration?.imagePlacement = .trailing
        btn.semanticContentAttribute = .forceRightToLeft
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: AppDimentions.shared.mediumMargin, bottom: 0, right: 0)
        return btn
    }()
    
    private let trailerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("Trailer", for: .normal)
        btn.setTitleColor(AppColors.backgroundColor, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: AppFonts.smallFontSizeHeader, weight: .medium)
        btn.setImage(AppImages.playbtn, for: .normal)
        btn.backgroundColor = AppColors.darkblue
        btn.layer.cornerRadius = AppDimentions.shared.bigRadius
        btn.semanticContentAttribute = .forceRightToLeft
        btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: AppDimentions.shared.mediumMargin, bottom: 0, right: 0)
        return btn
    }()
    
    private let slideCollectionViewlayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return layout
    }()
    
    //MARK: UI Lifecycle
    override func initView() {
        contentView.backgroundColor = AppColors.backgroundColor
        pushDataSlide()
        initSlideCollectionView()
        initShowtimesButton()
        initTrailerButton()
    }
    
    //MARK: Setup Views
    private func initSlideCollectionView() {
        slideCollectionView = UICollectionView(frame: .zero, collectionViewLayout: slideCollectionViewlayout)
        slideCollectionView.register(SlideCell.self, forCellWithReuseIdentifier: SlideCell.className)
        slideCollectionView.dataSource = self
        slideCollectionView.delegate = self
        slideCollectionView.isPagingEnabled = true
        slideCollectionView.showsHorizontalScrollIndicator = false
        contentView.addSubview(slideCollectionView)
        slideCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    let widthBtn = (UIScreen.main.bounds.width - AppDimentions.shared.giantMargin * 3) / 2
    let heightBtn = 60 * AppDimentions.shared.heightScale
    private func initShowtimesButton() {
        contentView.addSubview(showtimesButton)
        showtimesButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-AppDimentions.shared.mediumMargin)
            make.leading.equalToSuperview().offset(AppDimentions.shared.giantMargin)
            make.width.equalTo(widthBtn)
            make.height.equalTo(heightBtn)
        }
    }
    
    private func initTrailerButton() {
        contentView.addSubview(trailerButton)
        trailerButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-AppDimentions.shared.mediumMargin)
            make.leading.equalTo(showtimesButton.snp.trailing).offset(AppDimentions.shared.giantMargin)
            make.width.equalTo(widthBtn)
            make.height.equalTo(heightBtn)
        }
    }
    
    //MARK: Get Data
    private func pushDataSlide() {
        SlideNetworkManager.shared.getAllMovies { results in
            DispatchQueue.main.async {
                self.listItem = results
                self.slideCollectionView.reloadData()
            }
        }
    }
}

extension SlideSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let width = slideCollectionView.frame.height * RatioConstants.portraintImage
        return CGSize(width: slideCollectionView.frame.width, height: slideCollectionView.frame.height)
    }
}

extension SlideSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideCell.className, for: indexPath) as! SlideCell
        cell.configure(slideItem: listItem[indexPath.row])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listItem.count
    }
}

