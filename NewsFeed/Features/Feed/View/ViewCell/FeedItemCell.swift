//
//  FeedItemCell.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 08/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

final class FeedItemCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupCell()
    }
    
    private func setupCell() {
        self.contentView.layer.cornerRadius = 20
        self.contentView.layer.masksToBounds = true
        
        self.contentView.backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
