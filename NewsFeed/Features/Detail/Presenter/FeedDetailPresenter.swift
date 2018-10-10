//
//  FeedDetailPresenter.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 10/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation
import UIKit

final class FeedDetailPresenter {
    
    fileprivate unowned var view: FeedDetailViewProtocol
    let article: FeedDetailViewModel
    
    init(view: FeedDetailViewProtocol, viewModel: FeedDetailViewModel) {
        self.view = view
        self.article = viewModel
    }
}
