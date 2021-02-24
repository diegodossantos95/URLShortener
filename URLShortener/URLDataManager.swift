//
//  URLDataManager.swift
//  URLShortener
//
//  Created by dos Santos, Diego on 24/02/21.
//

import Foundation

protocol URLDataManagerProtocol {
    var networkClient: NetworkClientProtocol { get set }
    
    func post(url: ShortURL, completion: @escaping (ShortenedURL?, HTTPRequestError?) -> Void)
    func get(url: ShortenedURL, completion: @escaping (ShortURL?, HTTPRequestError?) -> Void)
}

class URLDataManager: URLDataManagerProtocol {
    var networkClient: NetworkClientProtocol
    let baseURL = "https://url-shortener-nu.herokuapp.com/api/alias"
    
    init(networkClient: NetworkClientProtocol) {
        self.networkClient = networkClient
    }
    
    func post(url: ShortURL, completion: @escaping (ShortenedURL?, HTTPRequestError?) -> Void) {
        networkClient.postHTTP(at: baseURL, withEncodableObj: url, withDecodableObj: ShortenedURL.self, withCompletion: completion)
    }
    
    func get(url: ShortenedURL, completion: @escaping (ShortURL?, HTTPRequestError?) -> Void) {
        networkClient.getHTTP(at: "\(baseURL)/\(url.alias)", withCompletion: completion)
    }
}
