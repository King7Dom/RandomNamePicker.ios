//
//  People.swift
//  RandomNamePicker
//
//  Created by Dominic's Macbook Pro on 27/4/17.
//  Copyright © 2017 King7Dom. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let profilePictureName: String
    
    init(name: String, profilePictureName: String? = nil) {
        self.name = name
        self.profilePictureName = profilePictureName ?? name
    }
}
