//
//  PullRequestViewModel.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import Foundation
import UIKit

final class PullRequestViewModel {
    
    let repositoryInfo: RepositoryInfo?
    var pullRequests: [PullRequest]?
    
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
        // COMENTARIO: Uma forma mais bonitinha de concatenar string é com String(format:...), fica bem mais facil de entender
        let url = URL(string: "https://api.github.com/repos/\(owner)/\(repositoryName)/pulls")

        RepositoriesManager.shared.getPullRequests(url: url) { pullRequests, error in
            self.pullRequests = pullRequests
            // COMENTARIO: Aqui voce tem muitos ifs e nem ta usando o error que recebe. Acho que voce pode usar o error e o pullRequests.isEmpty dessa forma: if error != nill && pullRequests.isEmpty { completion(nil) } ou algo assim. Dessa forma vc vai de 4 condições pra 1 só
            if let pullRequests = pullRequests {
                if pullRequests.count > 0 {
                    completion(pullRequests)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
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
    
}
