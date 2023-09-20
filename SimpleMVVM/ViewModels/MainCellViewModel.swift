//
//  MainCellViewModel.swift
//  SimpleMVVM
//
//  Created by Nikolai  on 20.09.2023.
//

import Foundation

class MainCellViewModel {
    var name: String
    var email: String
    
    init(_ user: Users) {
        self.name = user.username
        self.email = user.email
    }
}
