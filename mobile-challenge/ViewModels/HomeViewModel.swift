//
//  HomeViewModel.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import Foundation
import UIKit

final class HomeViewModel {
    
    let title = "GitHub JavaPop"
    
    private var repositories: [RepositoryInfo]?
    
    func getRepositories(completion: @escaping([RepositoryInfo]?) -> Void) {
        RepositoriesManager().getRepositories(success: { repositories in
            self.repositories = repositories
            if !repositories.isEmpty {
                completion(repositories)
                return
            }
            completion(nil)
        }, failure: { error in
            completion(nil)
        })
    }
    
    func getCountRepositories() -> Int {
        repositories?.count ?? 0
    }
    
    func getRepositoryByPosition(position: Int) -> RepositoryInfo? {
        repositories?[position]
    }
    
}
