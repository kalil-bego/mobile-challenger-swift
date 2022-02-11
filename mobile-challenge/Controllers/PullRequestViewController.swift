//
//  PullRequestViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import UIKit

final class PullRequestViewController: UIViewController {

    private var viewModel: PullRequestViewModel?
    
    // COMENTARIO: mesma coisa do comentario la na HomeViewController, vc tem view controller e view tudo num arquivo só
    private lazy var quantityPullRequest: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PullRequestTableViewCell.self, forCellReuseIdentifier: "PullRequestCell")
        tableView.rowHeight = 180

        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // COMENTARIO: essa viewDidLoad ta gigaaante, tenta quebrar as coisas em funções, fica mais organizado e muuuuuito mais facil de dar manutenção
        
        view.backgroundColor = .white
        title = viewModel?.repositoryInfo?.name
        
        view.addSubview(quantityPullRequest)
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                quantityPullRequest.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                quantityPullRequest.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                quantityPullRequest.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                quantityPullRequest.heightAnchor.constraint(equalToConstant: 40)
            ])
        } else {
            NSLayoutConstraint.activate([
                quantityPullRequest.topAnchor.constraint(equalTo: view.topAnchor),
                quantityPullRequest.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                quantityPullRequest.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                quantityPullRequest.heightAnchor.constraint(equalToConstant: 40)
            ])
        }
        
        let loadingView = LoadingView(frame: view.frame)
        view.insertSubview(loadingView, at: 0)
        loadingView.center = view.center
        
        let errorView = ErrorView(frame: view.frame)
        errorView.translatesAutoresizingMaskIntoConstraints = false
        
        viewModel?.getPullRequests(completion: { pullRequests in
            if pullRequests != nil {
                
                let openedPullRequests = self.viewModel?.openedPullRequests() ?? 0
                let closedPullRequests = self.viewModel?.closedPullRequests() ?? 0
                // COMENTARIO: Aqui o if e o else estão na main thread, dito isso vc poderia colocar a condição inteira dentro da main thread
                DispatchQueue.main.async {
                    self.quantityPullRequest.text = "\(openedPullRequests) opened / \(closedPullRequests) closed"
                    
                    self.view.addSubview(self.tableView)
                    NSLayoutConstraint.activate([
                        self.tableView.topAnchor.constraint(equalTo: self.quantityPullRequest.bottomAnchor),
                        self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                        self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                        self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                    ])
                }
            } else {
                DispatchQueue.main.async {
                    self.view.addSubview(errorView)
                    NSLayoutConstraint.activate([
                        errorView.topAnchor.constraint(equalTo: self.view.topAnchor),
                        errorView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                        errorView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                        errorView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
                    ])
                }
            }
        })

    }
    
    func setupViewModel(_ viewModel: PullRequestViewModel) {
        self.viewModel = viewModel
    }

}

extension PullRequestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.pullRequests?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PullRequestCell") as? PullRequestTableViewCell else {
            return UITableViewCell()
        }
        
        guard let pullRequest = viewModel?.pullRequests?[indexPath.row] else {
            return UITableViewCell()
        }
        // COMENTARIO: no MVVM a controller nunca deve fazer requisições, quem tem essa responsabilidade é a viewmodel
        RepositoriesManager.shared.getImageOwner(url: URL(string: pullRequest.user.picture)) { image, error in
            cell.setupCell(imageOwner: image ?? UIImage(),
                           pullRequest: PullRequest(state: pullRequest.state,
                                                    title: pullRequest.title,
                                                    user: pullRequest.user,
                                                    body: pullRequest.body))
        }
        
        return cell
    }
    
}
