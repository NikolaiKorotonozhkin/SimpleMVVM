//
//  ViewController.swift
//  SimpleMVVM
//
//  Created by Nikolai  on 18.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let activiryIndicator = UIActivityIndicatorView()
    
    var viewModel = MainViewModel()
    
    var cellDataSource = [MainCellViewModel]()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        viewModel.getUsers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        bindViewModel()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        title = "Main Screen"
        
        activiryIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activiryIndicator)
        
        view.addSubview(tableView)
        setupTableView()
    }
    
    private func bindViewModel() {
        viewModel.isLoading.bind { [weak self] isloading in
            guard let self, let isloading else { return }
            DispatchQueue.main.async {
                isloading ? self.activiryIndicator.startAnimating() : self.activiryIndicator.stopAnimating()
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] users in
            guard let self, let users else { return }
            self.cellDataSource = users
            self.reloadTableView()
        }
    }
    
    func presentDetailsViewController(user: User) {
        let detailViewModel = DetailsViewModel(user: user)
        let detailViewController = DetailsViewController(detailViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }

}

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            activiryIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            activiryIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
