//
//  SearchResponse.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

struct SearchResponse: Decodable {
    let results: [resultItem]
}

struct resultItem: Decodable {
    let id: String
    let title: String
}
