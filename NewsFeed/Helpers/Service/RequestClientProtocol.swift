//
//  RequestClientProtocol.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

protocol RequestClientProtocol {
    func request(method: RequestMethod, url: String, urlParameters: [String: String]?, parameters: [String: Any]?, success: @escaping (Any) -> Void, failure: @escaping (RequestError) -> Void)
}
