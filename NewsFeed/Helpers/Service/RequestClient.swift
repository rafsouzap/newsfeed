//
//  RequestClient.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

final class RequestClient {
    static let shared: RequestClientProtocol = URLSessionRequestClient()
}
