//
//  ShortenedURL.swift
//  URLShortener
//
//  Created by dos Santos, Diego on 24/02/21.
//

import Foundation

class ShortenedURL: Codable {
    
    init(alias: String) {
        self.alias = alias
    }
    
    var alias: String
}
