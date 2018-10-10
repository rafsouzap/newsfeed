//
//  Article.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct Article: Codable {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
    let images: [String]?
    
    enum CodingKeys: String, CodingKey {
        case source
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
        case images
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.source = try values.decode(Source.self, forKey: .source)
        self.author = try values.decodeIfPresent(String.self, forKey: .author)
        self.title = try values.decode(String.self, forKey: .title)
        self.description = try values.decode(String.self, forKey: .description)
        self.url = try values.decode(String.self, forKey: .url)
        self.urlToImage = try values.decode(String.self, forKey: .urlToImage)
        self.publishedAt = try values.decode(String.self, forKey: .publishedAt)
        self.content = try values.decode(String.self, forKey: .content)
        self.images = try values.decodeIfPresent([String].self, forKey: .images)
    }
}
