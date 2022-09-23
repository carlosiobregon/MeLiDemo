//
//  Item.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

struct Item: Decodable {
    let id: String
    let title: String
    let price: Double
    let currency: String
    let urlPicture: String?
    let attributes: [Attributes]?
}
