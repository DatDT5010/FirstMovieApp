//
//  HomeViewController.swift
//  FirstMovieApp
//
//  Created by Datdt on 30/10/2023.
//

import UIKit

class HomeViewController: BaseViewController {
    
    //MARK: UI Properties
    var tableEnum: [HomeEnum] = [.slide ,.genres, .tvShow, .popular, .topRated, .upcoming, .actor, .showTime]
    
    private var homeCollectionView: UICollectionView!
    
    private let homeColectionViewLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = AppDimentions.shared.mediumMarginSection
        return layout
    }()

    
    //MARK: UI Lifecycle
    override func initView() {
        view.backgroundColor = AppColors.backgroundColor
        
        initHomeCollectionView()
    }
    
    //MARK: Setup Views
    private func initHomeCollectionView() {
        //view.backgroundColor = .red
        homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: homeColectionViewLayout)
        homeCollectionView.register(PopularSection.self, forCellWithReuseIdentifier: PopularSection.className)
        homeCollectionView.register(TVShowSection.self, forCellWithReuseIdentifier: TVShowSection.className)
        homeCollectionView.register(TopRatedSection.self, forCellWithReuseIdentifier: TopRatedSection.className)
        homeCollectionView.register(UpcomingSection.self, forCellWithReuseIdentifier: UpcomingSection.className)
        homeCollectionView.register(GenresSection.self, forCellWithReuseIdentifier: GenresSection.className)
        homeCollectionView.register(ActorsSection.self, forCellWithReuseIdentifier: ActorsSection.className)
        homeCollectionView.register(SlideSection.self, forCellWithReuseIdentifier: SlideSection.className)
        homeCollectionView.register(ShowtimeMoviesSection.self, forCellWithReuseIdentifier: ShowtimeMoviesSection.className)
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self

        view.addSubview(homeCollectionView)
        homeCollectionView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch self.tableEnum[indexPath.row] {
        case .slide:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.slideHeight)
        case .genres:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.genresHeight)
        case .popular:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.popularHeight)
        case .tvShow:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.tvShowHeight)
        case .topRated:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.topRatedHeight)
        case .upcoming:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.upcomingHeight)
        case .actor:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.actorsHeight)
        case .showTime:
            return CGSize(width: homeCollectionView.frame.width, height: AppDimentions.shared.showTimeMoviesHeight)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableEnum.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch self.tableEnum[indexPath.row] {
        case .slide:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SlideSection.className, for: indexPath) as! SlideSection
            return cell
        case .genres:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenresSection.className, for: indexPath) as! GenresSection
            return cell
        case .tvShow:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVShowSection.className, for: indexPath) as! TVShowSection
            return cell
        case .popular:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularSection.className, for: indexPath) as! PopularSection
            return cell
        case .topRated:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopRatedSection.className, for: indexPath) as! TopRatedSection
            return cell
        case .upcoming:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UpcomingSection.className, for: indexPath) as! UpcomingSection
            return cell
        case .actor:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ActorsSection.className, for: indexPath) as! ActorsSection
            return cell
        case .showTime:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ShowtimeMoviesSection.className, for: indexPath) as! ShowtimeMoviesSection
            return cell
        }
    }
}


