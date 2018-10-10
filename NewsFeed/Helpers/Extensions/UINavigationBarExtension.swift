//
//  UINavigationBarExtension.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 10/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

extension UINavigationBar {
    
    func setBarColor(_ barColor: UIColor?) {
        if let color = barColor {
            if color.cgColor.alpha == 0 {
                self.setBackgroundImage(UIImage(), for: .default)
                self.hideShadow(true)
            } else {
                self.setBackgroundImage(self.image(with: color), for: .default)
                self.hideShadow(true)
            }
        } else {
            self.setBackgroundImage(nil, for: .default)
            self.hideShadow(false)
        }
    }
    
    func hideShadow(_ hide: Bool) {
        self.shadowImage = hide ? UIImage() : nil
    }
    
    func image(with color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(rect)
        }
        let image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
}
