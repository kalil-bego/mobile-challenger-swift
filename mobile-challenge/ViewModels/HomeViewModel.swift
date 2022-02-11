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
    
    var repositories: [RepositoryInfo]?
    
    func getRepositories(completion: @escaping([RepositoryInfo]?) -> Void) {
        RepositoriesManager.shared.getRepositories { repositories, _ in
            self.repositories = repositories
            
            if let repositories = repositories {
                if repositories.count > 0 {
                    completion(repositories)
                } else {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
    
}
