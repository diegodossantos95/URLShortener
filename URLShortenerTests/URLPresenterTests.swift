//
//  URLPresenterTests.swift
//  URLShortenerTests
//
//  Created by dos Santos, Diego on 24/02/21.
//

import XCTest
@testable import URLShortener

class URLPresenterTests: XCTestCase {
    var presenter: URLPresenter!
    
    override func setUp() {
        super.setUp()
        presenter = URLPresenter(dataManager: MockDataManager())
    }
    
    func testSave() {
        let expectation = XCTestExpectation(description: "completionCalledWithRightURL")
        let url = ShortURL(url: "1")
        
        presenter.save(url: url) { (shortenedURL, error) in
            XCTAssertEqual(url.url, shortenedURL?.alias)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
    
    func testGet() {
        let expectation = XCTestExpectation(description: "completionCalledWithRightURL")
        let url = ShortenedURL(alias: "1")
        
        presenter.get(shortenerURL: url) { (shortURL, error) in
            XCTAssertEqual(url.alias, shortURL?.url)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5.0)
    }
}

class MockDataManager: URLDataManagerProtocol {
    var networkClient: NetworkClientProtocol

    init() {
        networkClient = NetworkClient()
    }
    
    func post(url: ShortURL, completion: @escaping (ShortenedURL?, HTTPRequestError?) -> Void) {
        completion(ShortenedURL(alias: url.url), nil)
    }
    
    func get(url: ShortenedURL, completion: @escaping (ShortURL?, HTTPRequestError?) -> Void) {
        completion(ShortURL(url: url.alias), nil)
    }
}
