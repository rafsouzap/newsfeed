//
//  NSObjectExtension.swift
//  NewsFeed
//
//  Created by Rafael de Paula on 09/10/18.
//  Copyright © 2018 Rafael de Paula. All rights reserved.
//

import UIKit

protocol Identifying { }

extension Identifying where Self : NSObject {
    static var identifier: String { return String(describing: self) }
}

extension NSObject: Identifying { }
