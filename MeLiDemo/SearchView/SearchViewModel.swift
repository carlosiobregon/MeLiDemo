//
//  SearchViewModel.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 21/09/22.
//

import Foundation
import UIKit


protocol SearchViewModelProtocol {
    var searchText: String { get set }
    func launchSearch()
}

class SearchViewModel: SearchViewModelProtocol {
    var coordinator: MainCoordinator?
    var searchText = String()
    
    init(coordinator: MainCoordinator?) {
        self.coordinator = coordinator
    }
    
    func launchSearch() {
        coordinator?.launchSearchResultsView(text: searchText)
    }
}
