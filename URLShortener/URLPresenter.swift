//
//  URLPresenter.swift
//  URLShortener
//
//  Created by dos Santos, Diego on 24/02/21.
//

import Foundation

class URLPresenter {
    let dataManager: URLDataManagerProtocol
    
    init(dataManager: URLDataManagerProtocol) {
        self.dataManager = dataManager
    }
    
    func save(url: ShortURL, completion: @escaping (ShortenedURL?, HTTPRequestError?) -> Void) {
        dataManager.post(url: url, completion: completion)
    }
    
    func get(shortenerURL: ShortenedURL, completion: @escaping (ShortURL?, HTTPRequestError?) -> Void) {
        dataManager.get(url: shortenerURL, completion: completion)
    }
}
