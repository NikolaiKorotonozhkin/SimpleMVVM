//
//  NetworkRequest.swift
//  SimpleMVVM
//
//  Created by Nikolai  on 19.09.2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    
    private init() {}
    
    func getData(competionHandler: @escaping(Result<Data, NetworkError>) -> Void) {
        URLSession.shared.request(.users) { data, _, error in
            DispatchQueue.main.async {
                if error != nil {
                    competionHandler(.failure(.urlError))
                } else {
                    guard let data else { return }
                    competionHandler(.success(data))
                }
            }
        }
    }
}
