//
//  ItemResponse.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

struct ItemResponse: Decodable {
    let id: String
    let title: String
    let price: Double
    let currency_id: String
    let pictures: [PictureResponse]
    //let attributes: [Attributes]
}

struct PictureResponse: Decodable {
    var id: String
    var url: String
    var secure_url: String
    var size: String
    var max_size: String
    var quality: String
}

struct Attributes: Decodable {
    var name: String
    var value_name: String
}
