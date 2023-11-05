//
//  BaseNavigationController.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideNavigationBar()
        
//        let barBackButtonItemApperance = UIBarButtonItem.appearance()
//        barBackButtonItemApperance.setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        
//        let titleAttributes = [NSAttributedString.Key.foregroundColor:UIColor.orange]
//        self.navigationBar.titleTextAttributes = titleAttributes
        self.navigationBar.backgroundColor = AppColors.grey
        self.navigationBar.barTintColor = AppColors.grey
        //self.navigationBar.barTintColor = AppColors.backgroundColor

    }
    
    func hideNavigationBar() {
        navigationBar.isHidden = true
    }

}
