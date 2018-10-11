//
//  FeedDetailViewModel.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 10/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

struct FeedDetailViewModel {
    let title: String
    let description: String
    let authorName: String?
    let content: String
    let image: String
    let shareUrl: String
    
    init(with article: Article) {
        self.title = article.title
        self.description = article.description
        self.authorName = article.author
        self.content = article.content
        self.image = article.urlToImage
        self.shareUrl = article.url
    }
}

