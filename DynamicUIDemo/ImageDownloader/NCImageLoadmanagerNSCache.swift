//
//  NCImageLoadmanagerNSCache.swift
//  DynamicUIDemo
//
//  Created by Vivek Gupta on 18/06/18.
//  Copyright © 2018 Vivek Gupta. All rights reserved.
//

import Foundation

class NCImageLoadmanagerNSCache{
    static let shared = NCImageLoadmanagerNSCache()
    let imageCache = NSCache<NSString, UIImage>()
    
    private init() {
        
    }
}
