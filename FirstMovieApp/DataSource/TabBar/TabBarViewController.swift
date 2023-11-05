//
//  TabBarViewController.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        initTabbarStyle()
    }
    
    private func setupTabBar() {
        let homeVC = HomeViewController()
        homeVC.tabBarItem = createTabberItem(title: "Home", image: AppImages.icHome, imageSelected: AppImages.icHome)
        let searchVC = SearchViewController()
        searchVC.tabBarItem = createTabberItem(title: "Search", image: AppImages.icSearch, imageSelected: AppImages.icSearch)
        let favoriteVC = FavoriteViewController()
        favoriteVC.tabBarItem = createTabberItem(title: "Favorite", image: AppImages.icFavorite, imageSelected: AppImages.icFavorite)
        let theaterVC = TheaterViewController()
        theaterVC.tabBarItem = createTabberItem(title: "Theater", image: AppImages.icTheater, imageSelected: AppImages.icTheater)
        let settingVC = TheaterViewController()
        settingVC.tabBarItem = createTabberItem(title: "Setting", image: AppImages.icSetting, imageSelected: AppImages.icSetting)
        
        let homeNav = BaseNavigationController.init(rootViewController: homeVC)
        let searchNav = BaseNavigationController.init(rootViewController: searchVC)
        let favoriteNav = BaseNavigationController.init(rootViewController: favoriteVC)
        let theaterNav = BaseNavigationController.init(rootViewController: theaterVC)
        let settingNav = BaseNavigationController.init(rootViewController: settingVC)

        self.viewControllers = [homeNav, searchNav, favoriteNav, theaterNav, settingNav]
        
    }
    
    private func createTabberItem(title: String, image: UIImage?, imageSelected: UIImage?) -> UITabBarItem {
        let image = image
        let imageSelected = imageSelected
        let tabbarItem = UITabBarItem.init(title: title, image: image, selectedImage: imageSelected)
        return tabbarItem
    }

    private func initTabbarStyle() {
        self.tabBar.tintColor = AppColors.orange
        self.tabBar.barTintColor = AppColors.backgroundColor
        
        self.tabBar.selectionIndicatorImage = UIImage().createSelectionIndicator(color: AppColors.orange, size: CGSize(width: tabBar.frame.width/CGFloat(tabBar.items!.count) * 1.8 / 3, height: tabBar.frame.height + 33), lineWidth: 6)
    }
}
