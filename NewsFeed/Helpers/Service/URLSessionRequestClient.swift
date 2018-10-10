//
//  URLSessionRequestClient.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 07/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

final class URLSessionRequestClient: RequestClientProtocol {
    
    func request(method: RequestMethod, url: String, urlParameters: [String: String]?, parameters: [String: Any]?, success: @escaping (Data) -> Void, failure: @escaping (RequestError) -> Void) {
        guard let _url = URL(string: url) else {
            failure(RequestError.invalidUrl)
            return
        }
        
        var request = URLRequest(url: _url)
        request.httpMethod = method.value
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let jsonBody = parameters, let httpBody = try? JSONSerialization.data(withJSONObject: jsonBody) {
            request.httpBody = httpBody
        }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.global(qos: .background).async {
                guard let response = response as? HTTPURLResponse else {
                    failure(RequestError.invalidResponse)
                    return
                }
                
                guard 200 ... 300 ~= response.statusCode else {
                    failure(RequestError(code: response.statusCode))
                    return
                }
                
                guard let data = data else {
                    failure(RequestError.notMapped)
                    return
                }
                success(data)
            }
        }
        task.resume()
    }
}
