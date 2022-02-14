//
//  HomeViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 01/02/22.
//

import UIKit

final class HomeViewController: LoadingViewController {

    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.title
        
        let homeView = HomeView(frame: view.frame)
        homeView.setupTableView(delegate: self, dataSource: self)
        
        viewModel.getRepositories { repositories in
            if repositories != nil {
                DispatchQueue.main.async {
                    self.view.addSubview(homeView)
                }
            } else {
                DispatchQueue.main.async {
                    self.view.addSubview(ErrorView(frame: self.view.frame))
                }
            }
        }
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCountRepositories()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryCell") as? RepositoryTableViewCell else {
            return UITableViewCell()
        }
        
        guard let repository = viewModel.getRepositoryByPosition(position: indexPath.row) else {
            return UITableViewCell()
        }
        let url = URL(string: repository.user.picture)
        
        RepositoriesManager().getImageOwner(url: url, success: { image in
            cell.setupCell(imageOwner: image,
                           repositoryInfo: repository)
        }, failure: { error in
            print(error)
        })

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let repository = viewModel.getRepositoryByPosition(position: indexPath.row) else {
            return
        }
        let viewController = PullRequestViewController()
        viewController.setup(repositoryInfo: repository)
        navigationController?.pushViewController(viewController, animated: true)
    }

}
