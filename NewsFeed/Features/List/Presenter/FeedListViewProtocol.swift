//
//  FeedListViewProtocol.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

protocol FeedListViewProtocol: class {
    func showLoading()
    func hideLoading()
    func reloadCollectionView()
    func showAlertError(title: String, message: String, buttonTitle: String)
}
