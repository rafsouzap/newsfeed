//
//  UIImageExtension.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func addGradient(_ color: [CGColor], locations: [NSNumber]) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.superview!.frame
        gradient.colors = color
        gradient.locations = locations
        self.layer.addSublayer(gradient)
    }
}
