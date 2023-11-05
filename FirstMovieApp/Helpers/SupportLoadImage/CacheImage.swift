//
//  CacheImage.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import Foundation
import UIKit
import SDWebImage

class CachedImage: UIImageView {
    //MARK: Properties
    public static let imageCache = NSCache<NSString, UIImage>()
    
    private var urlStringForChecking: String?
    
    //MARK: Actions
    func loadImageUrl(urlString: String?, completionHandler: (() -> Void)? = nil) {
        
        guard let urlString = urlString else {
            completionHandler?()
            return
        }
        
        guard let urlRequest = URL(string: urlString) else {
            completionHandler?()
            return
        }
        
        urlStringForChecking = urlString
        
        self.sd_setImage(with: urlRequest, placeholderImage: UIImage(named: ""), options: SDWebImageOptions.refreshCached) {
            (image, error, type, url) in
            
            if self.urlStringForChecking == urlString {
                DispatchQueue.main.async {
                    if let image = image {
                        self.image = image
                    }
                    completionHandler?()
                }
            }
            
        }
    }
}

