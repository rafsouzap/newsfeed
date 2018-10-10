//
//  FeedListPresenter.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation
import UIKit

final class FeedListPresenter {
    
    fileprivate unowned var view: FeedListViewProtocol
    fileprivate let service: NewsService
    fileprivate var articles: [Article] = []
    fileprivate(set) var feedItems: [FeedItemViewModel] = []
    
    init(view: FeedListViewProtocol) {
        self.view = view
        self.service = NewsService()
    }
}

// MARK: - Public methods
extension FeedListPresenter {
    
    func loadData() {
        self.view.showLoading()
        self.service.getArticles(success: { result in
            let viewModel = result.compactMap { FeedItemViewModel(with: $0) }
            self.updateCollectionView(with: viewModel)
            self.articles = result
        }, failure: { fail in
            self.requestError(description: fail.description)
        })
    }
    
    func showDetail(index: Int) {
        if let controller = UIApplication.topViewController() {
            let viewModel = FeedDetailViewModel(with: self.articles[index])
            FeedRouter.showDetail(at: controller, with: viewModel)
        }
    }
}

// MARK: - Private methods
extension FeedListPresenter {
    
    fileprivate func updateCollectionView(with viewModel: [FeedItemViewModel]) {
        DispatchQueue.main.async {
            self.feedItems = viewModel
            self.view.hideLoading()
            self.view.reloadCollectionView()
        }
    }
    
    fileprivate func requestError(description: String) {
        DispatchQueue.main.async {
            self.view.hideLoading()
            self.view.showAlertError(title: "Erro", message: description, buttonTitle: "OK")
        }
    }
}
