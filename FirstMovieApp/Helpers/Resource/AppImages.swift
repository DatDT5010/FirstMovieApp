//
//  AppImages.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import UIKit

public class AppImages {
    static let sizeImageTabbar: CGFloat = 15
    //NavImg
    public static let icHome = UIImage(named: "icHome")!.resizeImage(image: UIImage(named: "icHome")!, targetSize: CGSizeMake(sizeImageTabbar, sizeImageTabbar))
    public static let icSearch = UIImage(named: "icSearch")!.resizeImage(image: UIImage(named: "icSearch")!, targetSize: CGSizeMake(sizeImageTabbar, sizeImageTabbar))
    public static let icFavorite = UIImage(named: "icFavorite")!.resizeImage(image: UIImage(named: "icFavorite")!, targetSize: CGSizeMake(sizeImageTabbar, sizeImageTabbar))
    public static let icTheater = UIImage(named: "icTheater")!.resizeImage(image: UIImage(named: "icTheater")!, targetSize: CGSizeMake(sizeImageTabbar, sizeImageTabbar))
    public static let icSetting = UIImage(named: "icSetting")!.resizeImage(image: UIImage(named: "icSetting")!, targetSize: CGSizeMake(sizeImageTabbar, sizeImageTabbar))
    
    public static let icArrow: UIImage? = UIImage(named: "rightArrow")
    public static let fiveStars: UIImage? = UIImage(named: "fiveStars")
    public static let map: UIImage? = UIImage(named: "map")
    public static let overlayWhite: UIImage? = UIImage(named: "whiteGradient")
    public static let overlayBlack: UIImage? = UIImage(named: "blackGradient")


    
    //ButtonImage
    public static let airplay = UIImage(named: "airplay")!.resizeImage(image: UIImage(named: "airplay")!, targetSize: CGSizeMake(30, 30))
    public static let playbtn = UIImage(named: "playbtn")!.resizeImage(image: UIImage(named: "playbtn")!, targetSize: CGSizeMake(30, 30))
    
}
