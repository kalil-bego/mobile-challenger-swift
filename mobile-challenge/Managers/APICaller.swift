//
//  APICaller.swift
//  mobile-challenge
//
//  Created by Kalil Bego on 02/02/22.
//

import Foundation

enum APIError: Error {
    case unknownError
}

final class APICaller {
    
    func call(request: URLRequest, success: @escaping(Data) -> Void, failure: @escaping(Error) -> Void) {
        URLSession.shared.dataTask(with: request as URLRequest) { data, response, error in
            if let data = data {
                success(data)
            } else {
                failure(error ?? APIError.unknownError)
            }
        }.resume()
    }
    
}
