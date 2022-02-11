//
//  RequestModel.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 08/02/22.
//

import Foundation

struct RequestModel: Codable {
    var total: Int
    var items: [RepositoryInfo]
    
    private enum CodingKeys: String, CodingKey {
        case total = "total_count"
        case items = "items"
    }
}
