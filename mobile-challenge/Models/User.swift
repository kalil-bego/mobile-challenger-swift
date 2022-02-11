//
//  User.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 02/02/22.
//

import Foundation
import UIKit

struct User: Codable {
    var name: String?
    var username: String
    var picture: String
    
    private enum CodingKeys: String, CodingKey {
        case username = "login"
        case picture = "avatar_url"
    }
}
