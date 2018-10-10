//
//  FeedListPresenter.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class FeedListPresenter {
    
    fileprivate unowned var view: FeedListViewProtocol
    fileprivate let service: NewsService
    fileprivate(set) var articles: [FeedItemViewModel] = []
    
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
        }, failure: { fail in
            self.requestError(description: fail.description)
        })
    }
}


// MARK: - Private methods

extension FeedListPresenter {
    
    fileprivate func updateCollectionView(with viewModel: [FeedItemViewModel]) {
        self.articles = viewModel
        self.view.hideLoading()
        self.view.reloadCollectionView()
    }
    
    fileprivate func requestError(description: String) {
        self.view.hideLoading()
        self.view.showAlertError(title: "Erro", message: description, buttonTitle: "OK")
    }
}
