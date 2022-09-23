//
//  SearchBarView.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 20/09/22.
//

import UIKit

class SearchBarView: UIView {

    
    //Mark: - Outlets
    lazy var viewContent: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Buscar en Mercado Libre"
        searchBar.searchBarStyle = .minimal
        searchBar.isUserInteractionEnabled = true
        searchBar.backgroundColor = .clear
        searchBar.searchTextField.backgroundColor = .white
        return searchBar
    }()
    
    //Mark: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyViewCode()
    }
    
    public convenience init(with searchBarDelegate: UISearchBarDelegate) {
        self.init(frame: .zero)
        searchBar.delegate = searchBarDelegate
    }
    
}

//Mark: - ViewCodeConfiguration
extension SearchBarView: ViewCodeConfiguration {
    func buildHierarchy() {
        addSubview(viewContent)
        addSubview(searchBar)
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            viewContent.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            viewContent.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            viewContent.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            viewContent.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    func configureViews() {
        backgroundColor = ConstantsUI.color.background
    }
    
}
