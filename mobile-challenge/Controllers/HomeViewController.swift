//
//  HomeViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 01/02/22.
//

import UIKit

final class HomeViewController: UIViewController {

    private let viewModel = HomeViewModel()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(RepositoryTableViewCell.self, forCellReuseIdentifier: "RepositoryCell")
        tableView.rowHeight = 150

        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        
        let loadingView = LoadingView(frame: view.frame)
        view.insertSubview(loadingView, at: 0)
        loadingView.center = view.center
        
        let errorView = ErrorView(frame: view.frame)
        
        viewModel.getRepositories { repositories in
            if repositories != nil {
                DispatchQueue.main.async {
                    self.view.addSubview(self.tableView)
                    NSLayoutConstraint.activate([
                        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                        self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
                        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                    ])
                }
            } else {
                DispatchQueue.main.async {
                    self.view.addSubview(errorView)
                    errorView.center = self.view.center
                }
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.repositories?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell") as? RepositoryTableViewCell else {
            return UITableViewCell()
        }
        
        guard let repository = viewModel.repositories?[indexPath.row] else {
            return UITableViewCell()
        }
        
        RepositoriesManager.shared.getImageOwner(url: URL(string: repository.user.picture)) { image, error in
            cell.setupCell(imageOwner: image ?? UIImage(),
                           repositoryInfo: repository)
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repository = viewModel.repositories?[indexPath.row] else { return }
        let viewController = PullRequestViewController()
        viewController.setupViewModel(PullRequestViewModel(repositoryInfo: repository))
        navigationController?.pushViewController(viewController, animated: true)
    }

}
