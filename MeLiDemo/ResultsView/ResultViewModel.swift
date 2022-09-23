//
//  ResultViewModel.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

protocol ResultViewModelProtocol {
    func searchItemsCount() -> Int
    func searchItemViewModel(at index: Int) -> SearchItemViewModel?
    func loadResults(completion: @escaping () -> Void)
    func launchDetail(index: Int)
}

class ResultViewModel: ResultViewModelProtocol {
    private var coordinator: MainCoordinator?
    private var search: SearchSender
    private var searchItems: [SearchItem]?
    
    init(search: SearchSender, coordinator: MainCoordinator?) {
        self.coordinator = coordinator
        self.search = search
    }
    
    func launchDetail(index: Int) {
        guard let item = searchItems?[index] else {
            Log.warning("Could not get id")
            return
        }
        let sender = ItemSender(id: item.id)
        coordinator?.launchDetailView(item: sender)
    }
    
    // MARK: View Model Accessors
    func searchItemViewModel(at index: Int) -> SearchItemViewModel? {
        guard let searchItem = searchItems?[index] else { return nil }
        
        return SearchItemViewModel(searchItem: searchItem)
    }
    
    func searchItemsCount() -> Int {
        return searchItems?.count ?? .zero
    }

    // MARK: Functions to trigger initial loading of data with callbacks
    func loadResults(completion: @escaping () -> Void) {
        MeliApi.get(search: search) { [weak self] value in
            self?.searchItems = value
            completion()
        }
    }

    
}
