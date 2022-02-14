//
//  PullRequestViewController.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import UIKit

final class PullRequestViewController: LoadingViewController {

    private var viewModel: PullRequestViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        title = viewModel?.getRepositoryName()
        
        let errorView = ErrorView(frame: view.frame)
        
        let pullRequestView = PullRequestView(frame: view.frame)
        pullRequestView.setupTableView(delegate: self, dataSource: self)
        
        viewModel?.getPullRequests(completion: { pullRequests in
            let openedPullRequests = self.viewModel?.openedPullRequests() ?? 0
            let closedPullRequests = self.viewModel?.closedPullRequests() ?? 0

            DispatchQueue.main.async {
                if pullRequests != nil {
                    pullRequestView.setTextQuantityPullRequest(opened: openedPullRequests, closed: closedPullRequests)
                    
                    self.view.addSubview(pullRequestView)
                } else {
                    self.view.addSubview(errorView)
                }
            }
        })

    }
    
    func setup(repositoryInfo: RepositoryInfo) {
        self.viewModel = PullRequestViewModel(repositoryInfo: repositoryInfo)
    }

}

extension PullRequestViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.getCountPullRequests() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PullRequestCell") as? PullRequestTableViewCell,
              let pullRequest = viewModel?.getPullRequestByPosition(position: indexPath.row) else {
            return UITableViewCell()
        }
        
        let url = URL(string: pullRequest.user.picture)
        
        viewModel?.getImage(url: url, completion: { image in
            cell.setupCell(imageOwner: image,
                           pullRequest: PullRequest(state: pullRequest.state,
                                                    title: pullRequest.title,
                                                    user: pullRequest.user,
                                                    body: pullRequest.body))
        })
        
        return cell
    }
    
}
