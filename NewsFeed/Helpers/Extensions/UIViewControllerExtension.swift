//
//  UIViewControllerExtension.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 10/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation
import UIKit

var loadingView: UIView = UIView()
var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

extension UIViewController {
    
    func showActivityIndicator() {
        let window = UIApplication.shared.keyWindow!
        
        loadingView.frame = window.frame
        loadingView.center = window.center
        loadingView.backgroundColor = UIColor(hexadecimal: 0x000000).withAlphaComponent(0.5)
        loadingView.clipsToBounds = true
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.style = .whiteLarge
        activityIndicator.center = CGPoint(x: loadingView.frame.size.width / 2, y: loadingView.frame.size.height / 2)
        
        loadingView.addSubview(activityIndicator)
        window.addSubview(loadingView)
        
        activityIndicator.startAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        UIView.animate(withDuration: 0.2, animations: {
            loadingView.alpha = 0
        }, completion: { _ in
            loadingView.removeFromSuperview()
        })
    }
}
