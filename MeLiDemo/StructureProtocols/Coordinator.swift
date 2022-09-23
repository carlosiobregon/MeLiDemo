//
//  Coordinator.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 20/09/22.
//

import Foundation
import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}
