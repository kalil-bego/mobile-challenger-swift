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
    private let decoder: JSONDecoder?
    
    static let shared = RepositoriesManager(decoder: JSONDecoder())
    
    init(decoder: JSONDecoder) {
        self.decoder = decoder
    }
    
    func getRepositories(completion: @escaping([RepositoryInfo]?, Error?) -> Void) {
        guard let url = URL(string: "https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1") else { return }
        let request = URLRequest(url: url)
        
        apiCaller.call(request: request, success: { data in
            do {
                let repositories = try self.decoder?.decode(RequestModel.self, from: data)
                completion(repositories?.items, nil)
            } catch let error {
                completion(nil, error)
            }
        }, failure: { error in
            completion(nil, error)
        })
    }
    
    func getImageOwner(url: URL?, completion: @escaping(UIImage?, Error?) -> Void) {
        let request = URLRequest(url: url ?? URL(fileURLWithPath: ""))
        
        apiCaller.call(request: request, success: { data in
            completion(UIImage(data: data), nil)
        }, failure: { error in
            completion(nil, error)
        })
    }
    
    func getPullRequests(url: URL?, completion: @escaping([PullRequest]?, Error?) -> Void) {
        let request = URLRequest(url: url ?? URL(fileURLWithPath: ""))
        
        apiCaller.call(request: request, success: { data in
            do {
                let pullRequests = try self.decoder?.decode([PullRequest].self, from: data)
                completion(pullRequests, nil)
            } catch let error {
                print(error)
                completion(nil, error)
            }
        }, failure: { error in
            completion(nil, error)
        })

    }
    
}
