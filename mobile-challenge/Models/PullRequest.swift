//
//  PullRequest.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 09/02/22.
//

import Foundation

struct PullRequest: Codable {
    var state: String
    var title: String
    var user: User
    var body: String?
}
