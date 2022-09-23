//
//  DetailViewController.swift
//  MeLiDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: - Outlets
    private let activityIndicator : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .large
        activity.startAnimating()
        return activity
    }()
    
    // MARK: - Attributes
    var shareView = DetailView()
    var viewModel: DetailViewModelProtocol?
    
    // MARK: - Lifecycle
    override func loadView() {
        view = shareView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.loadDetail { [weak self] item in
            self?.shareView.model = item
        }
    }

}
