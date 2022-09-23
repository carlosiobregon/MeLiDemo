//
//  ResultsViewController.swift
//  MeliDemo
//
//  Created by Carlos Obregon on 22/09/22.
//

import UIKit

class ResultsViewController: UITableViewController {

    //MARK: - Outlets
    private let activityIndicator : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.style = .large
        activity.startAnimating()
        return activity
    }()
    
    private let emptyView : EmptySearchView = {
        let emptyView = EmptySearchView()
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.isHidden = true
        return emptyView
    }()
    
    
    // MARK: - Attributes
    var viewModel: ResultViewModelProtocol?
    
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Results"
        view.backgroundColor = .systemBackground
        
        tableView.register(ResultsTableViewCell.self, forCellReuseIdentifier: ResultsTableViewCell.reuseIdentifier)
        
        activeIndicator()
        configureEmptyView()
        
        viewModel?.loadResults { [weak self] in
            if let count = self?.viewModel?.searchItemsCount(), count > .zero {
                self?.tableView.reloadData()
            }
            else {
                self?.emptyView.isHidden = false
            }
            self?.activityIndicator.stopAnimating()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    
    // MARK: - Configure View
    func configureEmptyView() {
        view.addSubview(emptyView)
        NSLayoutConstraint.activate([
            emptyView.heightAnchor.constraint(equalToConstant: 170),
            emptyView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -20),
            emptyView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            emptyView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    func activeIndicator() {
        view.addSubview(activityIndicator)
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor,
                                                       constant: -50),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    
    // MARK: - DataSource & Delegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.searchItemsCount() ?? .zero
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let customCell = tableView.dequeueReusableCell(withIdentifier: ResultsTableViewCell.reuseIdentifier, for: indexPath) as? ResultsTableViewCell else {
            return UITableViewCell()
        }

        customCell.model = viewModel?.searchItemViewModel(at: indexPath.row)
        
        return customCell
    
    }
    
}
