//
//  AppEnvironment.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

enum AppEnvironment {
    enum DeviceType {
        case iPad
        case iPhone
    }
    
    case baseServiceApi
    
    var value: String {
        switch self {
        case .baseServiceApi: return "https://s3.glbimg.com/v1/AUTH_0a546877ae934340a12a639673da6690/010bf5/challenge/"
        }
    }
}
