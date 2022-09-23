//
//  MeliApi.swift
//  MeliDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

enum ApiError: Error {
    case noDataAvailable
    case canNoProcessData
}

struct Scheme{
    static let https = "https"
}

struct Host {
    static let baseURL = "api.mercadolibre.com"
}

struct Paths {
    static let search = "/sites/MLA/search"
    static let detail = "/items/"
}

class MeliApi {
    
    static func get(search: SearchSender, completion: @escaping (_ value: [SearchItem]?) -> Void) {
        
        var components = URLComponents()
        components.scheme = Scheme.https
        components.host = Host.baseURL
        components.path = Paths.search
        components.queryItems = [
            URLQueryItem(name: "q", value: search.text)
        ]
        
        ProxyRest<SearchResponse>.makeRequest(url: components.url, methodType: .get, body: NilBody(), completion: { result in
            switch result {
            case .success(let response):
                let searchItems = response.results.map {
                    item -> SearchItem in
                    return SearchItem(id: item.id, title: item.title)
                }
                completion(searchItems)
                
            case .failure(_):
                Log.error("Bad server response")
            }
        })
    }
    
}

