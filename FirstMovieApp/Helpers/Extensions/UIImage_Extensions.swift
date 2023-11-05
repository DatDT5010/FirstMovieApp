//
//  Image_Extensions.swift
//  FirstMovieApp
//
//  Created by Datdt on 03/11/2023.
//

import UIKit

extension UIImage {
    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage? {
        let size = image.size
        
        let widthRatio  = targetSize.width  / size.width
        let heightRatio = targetSize.height / size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSize(width: size.width * heightRatio, height: size.height * heightRatio)
        } else {
            newSize = CGSize(width: size.width * widthRatio, height: size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
//    func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat, cornerRadiusBootom: CGFloat) -> UIImage {
//            UIGraphicsBeginImageContextWithOptions(size, false, 0)
//            color.setFill()
//        UIRectFill(CGRect(x: 0, y: 0, width: size.width, height: lineWidth))
//            let image = UIGraphicsGetImageFromCurrentImageContext()!
//            UIGraphicsEndImageContext()
//            return image
//        }
    
    func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        let innerRect = CGRect(x: 0, y: -2, width: size.width, height: lineWidth)

        let path = UIBezierPath(roundedRect: innerRect, cornerRadius: lineWidth/2)
        path.fill()

        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }

    
//    func createSelectionIndicator(color: UIColor, size: CGSize, lineWidth: CGFloat) -> UIImage {
//            UIGraphicsBeginImageContextWithOptions(size, false, 0)
//            color.setFill()
//            UIRectFill(CGRectMake(0, size.height - lineWidth, size.width, lineWidth))
//        let image = UIGraphicsGetImageFromCurrentImageContext()!
//            UIGraphicsEndImageContext()
//            return image
//        }
    
    
}
