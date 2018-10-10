//
//  NewsService.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class NewsService {
    
    func getArticles(success: @escaping ([Article]) -> Void, failure: @escaping (_ error: RequestError) -> Void) {
        let url = AppEnvironment.baseServiceApi.value.appending("news/api/content.json")
        
        RequestClient.shared.request(method: .get, url: url, urlParameters: nil, parameters: nil, success: { result in
            let response = try! JSONDecoder().decode(News.self, from: result)
            success(response.articles)
        }, failure: { fail in
            failure(RequestError(code: fail.code))
        })
    }
}
