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
        self.navigationController.view.backgroundColor = .white
    }

    func start() {
        navigationController.isNavigationBarHidden = true
        let rootController = SearchViewController()
        rootController.searchViewModel = SearchViewModel(coordinator: self)
        navigationController.setViewControllers([rootController], animated: true)
    }
    
    func launchSearchResultsView(text: String){
        
    }
    
}
