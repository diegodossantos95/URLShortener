//
//  ShortURL.swift
//  URLShortener
//
//  Created by dos Santos, Diego on 24/02/21.
//

import Foundation

class ShortURL: Codable {
    
    init(url: String) {
        self.url = url
    }
    
    var url: String
}
