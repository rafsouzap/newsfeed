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
        let controller = FeedListViewController()
        let presenter = FeedListPresenter(view: controller)
        controller.presenter = presenter
        
        let navigation = UINavigationController(rootViewController: controller)
        window?.rootViewController = navigation
    }
}

