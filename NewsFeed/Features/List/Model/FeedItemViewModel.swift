//
//  FeedItemViewModel.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

struct FeedItemViewModel {
    let title: String
    let image: String
    
    init(with article: Article) {
        self.title = article.title
        self.image = article.urlToImage
    }
}
