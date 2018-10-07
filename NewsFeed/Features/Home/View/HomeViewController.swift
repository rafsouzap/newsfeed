//
//  HomeViewController.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
//        self.collectionView.collectionViewLayout.invalidateLayout()
    }
}

// MARK: - Private methods

extension HomeViewController {
    
    fileprivate func setupUI() {
        self.setupNavigationBar()
        self.setupCollectionView()
        
        self.view.backgroundColor = .gray
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = "Notícias"
    }
    
    fileprivate func setupCollectionView() {
        
    }
}
