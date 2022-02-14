//
//  RepositoriesManager.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 02/02/22.
//

import Foundation
import UIKit

final class RepositoriesManager {
    
    private let apiCaller = APICaller()
    private let decoder = JSONDecoder()
    
    func getRepositories(success: @escaping([RepositoryInfo]) -> Void,
                         failure: @escaping(Error) -> Void) {

        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1") else { return }
        let request = URLRequest(url: url)

        apiCaller.call(request: request, success: { data in
            do {
                let repositories = try self.decoder.decode(RequestModel.self, from: data)
                success(repositories.items)
            } catch let error {
                failure(error)
            }
        }, failure: { error in
            failure(error)
        })
    }
    
    func getImageOwner(url: URL?,
                       success: @escaping(UIImage) -> Void,
                       failure: @escaping(Error) -> Void) {

        let request = URLRequest(url: url ?? URL(fileURLWithPath: ""))

        apiCaller.call(request: request, success: { data in
            success(UIImage(data: data) ?? UIImage())
        }, failure: { error in
            failure(error)
        })
    }
    
    func getPullRequests(url: URL?,
                         success: @escaping([PullRequest]) -> Void,
                         failure: @escaping(Error) -> Void) {

        let request = URLRequest(url: url ?? URL(fileURLWithPath: ""))

        apiCaller.call(request: request, success: { data in
            do {
                let pullRequests = try self.decoder.decode([PullRequest].self, from: data)
                success(pullRequests)
            } catch let error {
                failure(error)
            }
        }, failure: { error in
            failure(error)
        })

    }
    
}
