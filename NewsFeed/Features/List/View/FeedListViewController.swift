//
//  FeedListViewController.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class FeedListViewController: UIViewController {
    
    fileprivate var selectedCell = UICollectionViewCell()
    fileprivate var collectionView: UICollectionView!
    fileprivate var selectedIndexPath: IndexPath?
    
    fileprivate let transition = FeedDetailPopAnimator()
    
    var presenter: FeedListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.loadArticles()
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
            self.collectionView.collectionViewLayout = FeedListFlowLayout(device: .iPad)
        default:
            self.collectionView.collectionViewLayout.invalidateLayout()
            self.collectionView.collectionViewLayout = FeedListFlowLayout(device: .iPhone)
        }
    }
}

// MARK: - Private methods

extension FeedListViewController {
    
    fileprivate func setupUI() {
        self.setupNavigationBar()
        self.setupCollectionView()
        self.setupConstraints()
        
        self.view.backgroundColor = UIColor.viewBackgroundColor
    }
    
    fileprivate func setupNavigationBar() {
        self.navigationController?.navigationBar.setBarColor(UIColor.navigationBarColor)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .heavy)]
        self.navigationItem.title = "News Feed"
    }
    
    fileprivate func setupCollectionView() {
        self.collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        self.collectionView.register(FeedItemCell.self, forCellWithReuseIdentifier: "FeedItemCell")
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.backgroundColor = .clear
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(self.collectionView)
    }
    
    fileprivate func setupConstraints() {
        self.collectionView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 0).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: bottomLayoutGuide.topAnchor, constant: 0).isActive = true
        self.collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        self.collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    }
    
    fileprivate func loadArticles() {
        guard let presenter = self.presenter else {
            fatalError("Presenter can't be nil")
        }
        presenter.loadData()
    }
}

// MARK: - UICollectionView (delegate/datasource) methods

extension FeedListViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let presenter = self.presenter else {
            return 0
        }
        return presenter.articles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeedItemCell.identifier, for: indexPath) as? FeedItemCell else {
            fatalError("Couldn't dequeue \(FeedItemCell.identifier)")
        }
        
        guard let presenter = self.presenter else {
            fatalError("Present can't be nil")
        }
        
        let article = presenter.articles[indexPath.row]
        cell.fillOutlets(with: article)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedIndexPath = indexPath
        collectionView.performBatchUpdates(nil, completion: nil)
        
        if let cell = collectionView.cellForItem(at: indexPath) {
            self.selectedCell = cell
            
            let controller = FeedDetailViewController()
            controller.modalPresentationStyle = .formSheet
            controller.transitioningDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 10)
    }
}

// MARK: - UIViewControllerTransitioningDelegate methods

extension FeedListViewController: UIViewControllerTransitioningDelegate {

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.originFrame = self.selectedCell.superview!.convert(selectedCell.frame, to: nil)
        transition.presenting = true
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        return transition
    }
}

extension FeedListViewController: FeedListViewProtocol {
    
    func showLoading() {
        
    }
    
    func hideLoading() {
        
    }
    
    func reloadCollectionView() {
        UIView.transition(with: self.collectionView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            self.collectionView.reloadData()
        })
    }
    
    func showAlertError(title: String, message: String, buttonTitle: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
