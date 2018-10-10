//
//  Source.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import Foundation

struct Source: Codable {
    let id: String
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decode(String.self, forKey: .id)
        self.name = try values.decode(String.self, forKey: .name)
    }
}
