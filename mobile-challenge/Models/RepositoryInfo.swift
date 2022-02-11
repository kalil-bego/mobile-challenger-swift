//
//  RepositoryInfo.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 02/02/22.
//

import Foundation

struct RepositoryInfo: Codable {
    var name: String
    var description: String
    var user: User
    var numbersOfStars: Int
    var numbersOfForks: Int
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case user = "owner"
        case numbersOfStars = "stargazers_count"
        case numbersOfForks = "forks_count"
    }
}
