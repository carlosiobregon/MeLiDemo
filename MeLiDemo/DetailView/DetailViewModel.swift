//
//  DetailViewModel.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import Foundation

protocol DetailViewModelProtocol {
    var item: Item? { get }
    func loadDetail(completion: @escaping (_ item: Item?) -> Void)
}

class DetailViewModel: DetailViewModelProtocol {
    var item: Item?
    private var coordinator: MainCoordinator?
    private var itemSender: ItemSender
    private var searchItems: [SearchItem]?
    
    init(item: ItemSender, coordinator: MainCoordinator?) {
        self.coordinator = coordinator
        self.itemSender = item
    }
    
    func loadDetail(completion: @escaping (_ item: Item?) -> Void) {
        MeliApi.getDetail(byId: itemSender) { [weak self] value in
            self?.item = value
            completion(self?.item)
        }
    }
    
}
