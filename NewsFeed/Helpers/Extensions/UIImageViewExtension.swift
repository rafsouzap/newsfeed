//
//  UIImageViewExtension.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView {
    
    func addGradient(_ color: [CGColor], locations: [NSNumber]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.superview!.frame
        gradient.colors = color
        gradient.locations = locations
        self.layer.addSublayer(gradient)
    }
    
    func downloadFrom(url urlString: String, contentMode mode: UIView.ContentMode = .scaleAspectFill, alpha: CGFloat) {
        guard URL(string: urlString) != nil else {
            fatalError("Invalid URL")
        }
        
        self.image = UIImage()
        self.animateAppearance(duration: 0.25, option: .curveEaseIn, alpha: alpha)
        self.contentMode = mode
        self.alpha = alpha
        
        if let imageFromCache = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
            self.image = imageFromCache
            self.animateAppearance(duration: 0.4, option: .curveEaseOut, alpha: alpha)
            return
        }
        
        RequestClient.shared.downloadImage(url: urlString, success: { result in
            DispatchQueue.main.async {
                if let imageToCache = UIImage(data: result) {
                    self.image = imageToCache
                    self.animateAppearance(duration: 0.4, option: .curveEaseOut, alpha: alpha)
                    imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                }
            }
        }, failure: { fail in
            
        })
    }
    
    private func animateAppearance(duration: Double, option: UIView.AnimationOptions, alpha: CGFloat) {
        UIView.animate(withDuration: duration, delay: 0, options: option, animations: {
            self.alpha = alpha
        })
    }
}
