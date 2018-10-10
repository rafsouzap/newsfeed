//
//  FeedItemCell.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 08/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class FeedItemCell: UICollectionViewCell {
    
    static let identifider = "FeedItemCell"
    
    private var articleImage: UIImageView!
    private var articleTitle: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupCell()
        self.setupConstraints()
    }
    
    func fillOutlets(with model: FeedItemViewModel) {
        self.articleTitle.text = model.title
        self.articleImage.downloadFrom(url: model.image, contentMode: .scaleAspectFill, alpha: 0.4)
    }
    
    private func setupCell() {
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        self.contentView.backgroundColor = .black
    
        self.articleImage = UIImageView()
        self.articleImage.contentMode = .scaleToFill
        self.articleImage.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.articleImage)

        self.articleTitle = UILabel()
        self.articleTitle.textAlignment = .left
        self.articleTitle.textColor = .white
        self.articleTitle.font = UIFont.boldSystemFont(ofSize: 19)
        self.articleTitle.numberOfLines = 0
        self.articleTitle.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.articleTitle)
        
        self.articleTitle.text = "Título"
    }
    
    private func setupConstraints() {
        self.articleImage.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0).isActive = true
        self.articleImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        self.articleImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0).isActive = true
        self.articleImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0).isActive = true
        
        self.articleTitle.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -15).isActive = true
        self.articleTitle.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 15).isActive = true
        self.articleTitle.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -15).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
