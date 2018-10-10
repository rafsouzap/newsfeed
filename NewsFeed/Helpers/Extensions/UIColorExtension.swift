//
//  UIColorExtension.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 10/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

extension UIColor {
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red value")
        assert(green >= 0 && green <= 255, "Invalid green value")
        assert(blue >= 0 && blue <= 255, "Invalid blue value")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(hexadecimal: Int) {
        self.init(red:(hexadecimal >> 16) & 0xff, green:(hexadecimal >> 8) & 0xff, blue:hexadecimal & 0xff)
    }
}

extension UIColor {
    static let viewBackgroundColor = UIColor(hexadecimal: 0xDDDDDD)
    static let navigationBarColor = UIColor(hexadecimal: 0x142B3A)
    static let navigationBarFontColor = UIColor(hexadecimal: 0xFBD221)
}
