//
//  MainViewModel.swift
//  SimpleMVVM
//
//  Created by Nikolai  on 18.09.2023.
//

import Foundation

class MainViewModel {
    
    func numberOfSection() -> Int {
        1
    }
    
    func numbersOfRows(_ section: Int) -> Int {
        10
    }
    
    func getUsers() {
        NetworkDataFetch.shared.fetchUsers { users, error in
            if error != nil {
                print("Notify user")
            } else if let users {
                print(users.count)
            }
        }
    }
}
