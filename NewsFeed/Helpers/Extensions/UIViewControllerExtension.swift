//
//  UIViewControllerExtension.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showError(with title: String, message: String? = nil, handler: ((UIAlertAction) -> Void)? = nil) {
        if !Thread.current.isMainThread {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.showError(with: title, message: message, handler: handler)
            }
            return
        }
        
        let attributedString = NSAttributedString(string: title, attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        
        let controller = UIAlertController(title: "", message: "", preferredStyle: .alert)
        controller.setValue(attributedString, forKey: "attributedTitle")
        controller.view.tintColor = .black
        controller.addAction(UIAlertAction(title: "OK", style: .default, handler: handler))
        present(controller, animated: true, completion: nil)
    }
    
    func showErrorWithDelay(_ title: String) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.1) {
            self.showError(with: title)
        }
    }
}
