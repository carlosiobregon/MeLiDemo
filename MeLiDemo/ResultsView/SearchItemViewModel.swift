//
//  SearchItemViewModel.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

struct SearchItemViewModel {
    let searchItem: SearchItem
        
    func title() -> String {
        return searchItem.title
    }
}
