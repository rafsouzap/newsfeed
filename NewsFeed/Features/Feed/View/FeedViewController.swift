//
//  FeedViewController.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {

    fileprivate let selectedCell = UICollectionViewCell()
    var collectionView: UICollectionView!
    
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
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        switch (traitCollection.verticalSizeClass, traitCollection.horizontalSizeClass) {
        case (.regular, .regular), (.compact, .regular), (.compact, .compact):
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.collectionViewLayout = FeedItemViewLayout(device: .iPad)
        default:
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.collectionViewLayout = FeedItemViewLayout(device: .iPhone)
        }
    }
}

// MARK: - Private methods

extension FeedViewController {
    
    fileprivate func setupUI() {
        self.setupNavigationBar()
        self.setupCollectionView()
        self.setupConstraints()
        
        self.view.backgroundColor = .gray
    }
    
    fileprivate func setupNavigationBar() {
        navigationItem.title = "Notícias"
    }
    
    fileprivate func setupCollectionView() {
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.register(FeedItemCell.self, forCellWithReuseIdentifier: "FeedItemCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .clear
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(self.collectionView)
        
//        self.collectionView.refreshControl = refreshControl
//        refreshControl.addTarget(self, action: #selector(DailyFeedNewsController.refreshData(_:)), for: UIControlEvents.valueChanged)
        
//        if #available(iOS 11.0, *) {
//            self.collectionView.dragDelegate = self
//            self.collectionView.dragInteractionEnabled = true
//        }
    }
    
    fileprivate func setupConstraints() {
        self.collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
}

// MARK: - UICollectionView (delegate/datasource) methods

extension FeedViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeedItemCell", for: indexPath) as! FeedItemCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 10)
    }
}

// MARK: - UIViewControllerTransitioningDelegate methods

extension FeedViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //        transition.originFrame = selectedCell.superview!.convert(selectedCell.frame, to: nil)
        //        transition.presenting = true
        //        return transition
        return nil
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //        transition.presenting = false
        //        return transition
        return nil
    }
}
