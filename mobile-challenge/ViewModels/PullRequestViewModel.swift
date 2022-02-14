//
//  PullRequestViewModel.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import Foundation
import UIKit

final class PullRequestViewModel {
    
    private let repositoryInfo: RepositoryInfo?
    private var pullRequests: [PullRequest]?
    
    init(repositoryInfo: RepositoryInfo) {
        self.repositoryInfo = repositoryInfo
    }
    
    func getPullRequests(completion: @escaping([PullRequest]?) -> Void) {
        guard let repositoryInfo = repositoryInfo else {
            completion(nil)
            return
        }

        let owner = repositoryInfo.user.username
        let repositoryName = repositoryInfo.name
        let url = URL(string: "https://api.github.com/repos/\(owner)/\(repositoryName)/pulls")

        RepositoriesManager().getPullRequests(url: url, success: { pullRequests in
            self.pullRequests = pullRequests
            
            if !pullRequests.isEmpty {
                completion(pullRequests)
                return
            }
            
            completion(nil)
        }, failure: { error in
            completion(nil)
        })
    }
    
    func openedPullRequests() -> Int {
        guard let pullRequests = pullRequests else {
            return 0
        }

        return pullRequests.filter { $0.state == "open" }.count
    }
    
    func closedPullRequests() -> Int {
        guard let pullRequests = pullRequests else {
            return 0
        }

        return pullRequests.filter { $0.state != "open" }.count
    }
    
    func getCountPullRequests() -> Int {
        pullRequests?.count ?? 0
    }
    
    func getRepositoryName() -> String {
        repositoryInfo?.name ?? ""
    }
    
    func getPullRequestByPosition(position: Int) -> PullRequest? {
        pullRequests?[position]
    }
    
    func getImage(url: URL?, completion: @escaping(UIImage) -> Void) {
        RepositoriesManager().getImageOwner(url: url, success: { image in
            completion(image)
        }, failure: { error in
            print(error)
        })
    }
    
}
