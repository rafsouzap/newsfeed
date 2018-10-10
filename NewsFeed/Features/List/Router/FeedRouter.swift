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
    
    class func showDetail(at parent: UIViewController, with model: FeedDetailViewModel) {
        let controller = FeedDetailViewController()
        let presenter = FeedDetailPresenter(view: controller, viewModel: model)
        controller.presenter = presenter
        controller.modalPresentationStyle = .formSheet
        controller.transitioningDelegate = parent as? UIViewControllerTransitioningDelegate
        
        parent.present(controller, animated: true, completion: nil)
    }
}
