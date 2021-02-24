//
//  URLDataManager.swift
//  URLShortener
//
//  Created by dos Santos, Diego on 24/02/21.
//

import Foundation

struct URLDataManager {
    let networkClient: NetworkClient
    let baseURL = "https://url-shortener-nu.herokuapp.com/api/alias"
    
    func post(url: ShortURL, completion: @escaping (ShortenedURL?, HTTPRequestError?) -> Void) {
        networkClient.postHTTP(at: baseURL, withEncodableObj: url, withDecodableObj: ShortenedURL.self, withCompletion: completion)
    }
    
    func get(url: ShortenedURL, completion: @escaping (ShortURL?, HTTPRequestError?) -> Void) {
        networkClient.getHTTP(at: "\(baseURL)/\(url.alias)", withCompletion: completion)
    }
}
