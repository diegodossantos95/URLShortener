//
//  ContentView.swift
//  URLShortener
//
//  Created by dos Santos, Diego on 24/02/21.
//

import SwiftUI

struct ContentView: View {
    let presenter = URLPresenter(dataManager: URLDataManager(networkClient: NetworkClient()))
    @State var url = ""
    @State var urlList = [ShortenedURL]()
    
    var body: some View {
        VStack {
            TextField("URL", text: $url)
            Button("Click me") {
                self.save(url: url)
            }
            List(urlList, id: \.alias, rowContent: { url in
                Button(url.alias) {
                    self.get(shortenedURL: url)
                }
            })
        }
    }
    
    private func save(url: String) {
        presenter.save(url: ShortURL(url: url), completion: { (shortenedURL, error) in
            if let error = error {
                print(error)
            } else if let shortenedURL = shortenedURL {
                urlList.append(shortenedURL)
            }
            
            self.url = ""
        })
    }
    
    private func get(shortenedURL: ShortenedURL) {
        presenter.get(shortenerURL: shortenedURL) { (shortURL, error) in
            if let error = error {
                print(error)
            } else if let shortURL = shortURL {
                print(shortURL.url)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
