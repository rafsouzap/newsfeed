//
//  FeedDetailViewController.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class FeedDetailViewController: UIViewController {

    fileprivate var scrollView: UIScrollView!
    fileprivate var stackView: UIStackView!
    fileprivate var dismissDetailButton: UIButton!
    fileprivate var shareArticleButton: UIButton!
    fileprivate var articleImage: UIImageView!
    fileprivate var articleTitle: UILabel!
    fileprivate var articleDescription: UILabel!
    fileprivate var articleAuthor: UILabel!
    fileprivate var articleContent: UILabel!
    
    var presenter: FeedDetailPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        self.fillOutlets()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 0.5) {
            self.setNeedsStatusBarAppearanceUpdate()
        }  
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.articleTitle.center.y += 20
        self.articleDescription.center.y += 20
        self.articleAuthor.center.y += 20
        self.articleContent.center.y += 20
        
        UIView.animate(withDuration: 0.07, delay: 0.0, options: .curveEaseIn, animations: {
            self.articleTitle.alpha = 1.0
            self.articleTitle.center.y -= 20
            self.articleAuthor.alpha = 1.0
            self.articleAuthor.center.y -= 20
            self.articleDescription.alpha = 1.0
            self.articleDescription.center.y -= 20
        })
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.articleContent.center.y -= 20
            self.articleContent.alpha = 1.0
        })
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.scrollView.contentSize = CGSize(width: self.stackView.frame.width, height: self.stackView.frame.height + 10)
    }

    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// MARK: - Button events
extension FeedDetailViewController {
    
    @IBAction func dismissDetailButtonTouched(_ sender: UIButton) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }
}

// MARK: - FeedDetailViewProtocol methods
extension FeedDetailViewController: FeedDetailViewProtocol {
    
    func showLoading() {
        self.showActivityIndicator()
    }
    
    func hideLoading() {
        self.hideActivityIndicator()
    }
}

// MARK: - Private methods
extension FeedDetailViewController {
    
    fileprivate func setupUI() {
        
        self.scrollView = UIScrollView()
        self.scrollView.translatesAutoresizingMaskIntoConstraints = false
        self.scrollView.contentInset = UIEdgeInsets(top: 310, left: 0, bottom: 0, right: 0)
        self.view.addSubview(self.scrollView)
        
        self.stackView = UIStackView()
        self.stackView.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.axis = .vertical
        self.stackView.spacing = 10
        self.scrollView.addSubview(self.stackView)

        self.articleImage = UIImageView()
        self.articleImage.translatesAutoresizingMaskIntoConstraints = false
        self.articleImage.backgroundColor = .white
        self.articleImage.layer.masksToBounds = true
        self.view.addSubview(self.articleImage)

        self.dismissDetailButton = UIButton(type: .system)
        self.dismissDetailButton.setImage(UIImage(named: "IconArrow"), for: .normal)
        self.dismissDetailButton.tintColor = .white
        self.dismissDetailButton.translatesAutoresizingMaskIntoConstraints = false
        self.dismissDetailButton.addTarget(self, action: #selector(dismissDetailButtonTouched(_:)), for: .touchUpInside)
        self.view.addSubview(self.dismissDetailButton)
        
        self.shareArticleButton = UIButton(type: .system)
        self.shareArticleButton.setImage(UIImage(named: "IconShare"), for: .normal)
        self.shareArticleButton.tintColor = .white
        self.shareArticleButton.translatesAutoresizingMaskIntoConstraints = false
        self.shareArticleButton.addTarget(self, action: #selector(dismissDetailButtonTouched(_:)), for: .touchUpInside)
        self.view.addSubview(self.shareArticleButton)
        
        self.articleTitle = UILabel()
        self.articleTitle.textColor = .black
        self.articleTitle.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.articleTitle.numberOfLines = 0
        self.articleTitle.alpha = 0
        self.articleTitle.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(self.articleTitle)
        
        self.articleDescription = UILabel()
        self.articleDescription.textColor = .darkGray
        self.articleDescription.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        self.articleDescription.numberOfLines = 0
        self.articleDescription.alpha = 0
        self.articleDescription.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(self.articleDescription)

        self.articleAuthor = UILabel()
        self.articleAuthor.textColor = .darkGray
        self.articleAuthor.font = UIFont.systemFont(ofSize: 12)
        self.articleAuthor.numberOfLines = 0
        self.articleAuthor.alpha = 0
        self.articleAuthor.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(self.articleAuthor)

        self.articleContent = UILabel()
        self.articleContent.textColor = .darkGray
        self.articleContent.font = UIFont.systemFont(ofSize: 14)
        self.articleContent.numberOfLines = 0
        self.articleContent.alpha = 0
        self.articleContent.translatesAutoresizingMaskIntoConstraints = false
        self.stackView.addArrangedSubview(self.articleContent)
        
        self.setupConstraints()
        self.view.backgroundColor = UIColor.viewBackgroundColor
        
        self.articleImage.addGradient([UIColor.black.withAlphaComponent(0.7).cgColor,
                                       UIColor.clear.cgColor,
                                       UIColor.black.withAlphaComponent(0.6).cgColor],
                                      locations: [0.0, 0.2, 1.0])
    }
    
    fileprivate func setupConstraints() {
        let margins = self.view.layoutMarginsGuide

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": self.scrollView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[scrollView]|", options: .alignAllCenterX, metrics: nil, views: ["scrollView": self.scrollView]))
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[stackView]|", options: .alignAllCenterX, metrics: nil, views: ["stackView": self.stackView]))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[stackView]|", options: .alignAllCenterX, metrics: nil, views: ["stackView": self.stackView]))
        
        self.dismissDetailButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 12).isActive = true
        self.dismissDetailButton.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 4).isActive = true
        self.dismissDetailButton.widthAnchor.constraint(equalTo: self.dismissDetailButton.heightAnchor, multiplier: 1).isActive = true
        self.dismissDetailButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.shareArticleButton.topAnchor.constraint(equalTo: margins.topAnchor, constant: 12).isActive = true
        self.shareArticleButton.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: -4).isActive = true
        self.shareArticleButton.widthAnchor.constraint(equalTo: self.shareArticleButton.heightAnchor, multiplier: 1).isActive = true
        self.shareArticleButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        self.articleImage.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        self.articleImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        self.articleImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.articleTitle.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        self.articleTitle.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        
        self.articleDescription.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        self.articleDescription.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        
        self.articleAuthor.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        self.articleAuthor.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
        
        self.articleContent.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 0).isActive = true
        self.articleContent.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 0).isActive = true
    }
    
    fileprivate func fillOutlets() {
        guard let presenter = self.presenter else {
            fatalError("Presenter can't be nil")
        }
        
        self.articleTitle.text = presenter.article.title
        self.articleDescription.text = presenter.article.description
        self.articleAuthor.text = presenter.article.authorName
        self.articleContent.text = presenter.article.content
        self.articleImage.downloadFrom(url: presenter.article.image, alpha: 1)
    }
}
