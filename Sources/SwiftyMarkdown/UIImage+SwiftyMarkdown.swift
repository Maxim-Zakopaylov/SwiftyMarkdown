//
//  UIImage+SwiftyMarkdown.swift
//  SwiftyMarkdown
//
//  Created by Maxim Zakopaylov on 17.06.2021.
//

import Foundation
#if os(iOS)
import UIKit
import AVFoundation

public extension UIImage {
    func height(forWidth width: CGFloat) -> CGFloat {
        let boundingRect = CGRect(
            x: 0,
            y: 0,
            width: width,
            height: CGFloat(MAXFLOAT)
        )
        let rect = AVMakeRect(
            aspectRatio: size,
            insideRect: boundingRect
        )
        return rect.size.height
    }
    
    func resizedImage(newSize: CGSize) -> UIImage? {
        guard size != newSize else { return self }

        let hasAlpha = false
        let scale: CGFloat = 0.0
        UIGraphicsBeginImageContextWithOptions(newSize, !hasAlpha, scale)
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)

        draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

#endif
