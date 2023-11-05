//
//  SupportLoadImage.swift
//  FirstMovieApp
//
//  Created by Datdt on 31/10/2023.
//

import Foundation
import UIKit

class SupportLoadImage {
    static func getFullImageUrl(_ imageName: String?) -> String? {
        guard let image = imageName else {
            return nil
        }
        return URLConstants.baseImageURL + image
    }
    
    
    static func loadImageFromDiskWith(fileName: String) -> UIImage? {

        let documentDirectory = FileManager.SearchPathDirectory.documentDirectory

        let userDomainMask = FileManager.SearchPathDomainMask.userDomainMask
        let paths = NSSearchPathForDirectoriesInDomains(documentDirectory, userDomainMask, true)

        if let dirPath = paths.first {
            let imageUrl = URL(fileURLWithPath: dirPath).appendingPathComponent(fileName)
            let image = UIImage(contentsOfFile: imageUrl.path)
            return image
        }

        return nil
    }
    
    
//    static func getImageGoogleMapUrl(photoReference: String) -> String {
//        return "https://maps.googleapis.com/maps/api/place/photo?maxwidth=500&photo_reference=\(photoReference)&key=\(APIClient.googleApiKey)"
//    }
}

