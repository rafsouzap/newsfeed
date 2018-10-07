//
//  HomeRouter.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class HomeRouter {
    
    class func present(at window: UIWindow?) {
        
        let controller = HomeViewController()
//        let navigationPresenter  = NavigationPresenter(view: navigationView)
//        navigationView.presenter = navigationPresenter
        
        window?.rootViewController = controller
    }
}

