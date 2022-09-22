//
//  SearchViewController.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 16/09/22.
//

import UIKit

class SearchViewController: UIViewController {

    
    //Mark: - Attributes
    var searchViewModel: SearchViewModelProtocol?
    var searchBarView: SearchBarView?
    
    
    //Mark: - Lifecycle
    override func loadView() {
        searchBarView = SearchBarView(with: self)
        view = searchBarView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchViewModel?.searchText = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchViewModel?.launchSearch()
    }
}
