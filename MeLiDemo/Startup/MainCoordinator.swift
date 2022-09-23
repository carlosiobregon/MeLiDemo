//
//  MainCoordinator.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 20/09/22.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.navigationController.view.backgroundColor = .systemBackground
        configureAppearance()
    }

    func start() {
        let rootController = SearchViewController()
        rootController.searchViewModel = SearchViewModel(coordinator: self)
        navigationController.setViewControllers([rootController], animated: true)
    }
    
    func launchSearchResultsView(search: SearchSender){
        let viewModel = ResultViewModel(search: search, coordinator: self)
        let resultsViewController = ResultsViewController()
        resultsViewController.viewModel = viewModel
        navigationController.pushViewController(resultsViewController, animated: true)
    }
    
}

extension MainCoordinator {
    
    func configureAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = ConstantsUI.color.background
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        
        self.navigationController.navigationBar.tintColor = .black
        self.navigationController.navigationBar.standardAppearance = appearance
        self.navigationController.navigationBar.compactAppearance = appearance
        self.navigationController.navigationBar.scrollEdgeAppearance = appearance
    }
    
}
