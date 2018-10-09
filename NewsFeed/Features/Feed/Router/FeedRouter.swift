//
//  FeedRouter.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class FeedRouter {
    
    class func present(at window: UIWindow?) {
        
        let controller = FeedViewController()
        let navigation = UINavigationController(rootViewController: controller)
        
//        let controller = UIStoryboard(name: "NewsFeed", bundle: nil).instantiateViewController(withIdentifier: FeedViewController.identifier) as! FeedViewController
//        let navigationPresenter  = NavigationPresenter(view: navigationView)
//        navigationView.presenter = navigationPresenter
        
        window?.rootViewController = navigation
    }
}

