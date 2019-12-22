//
//  User.swift
//  HTMessaging
//
//  Created by Hector Jose Alvarado Chapa on 22/12/19.
//  Copyright © 2019 Hector Jose Alvarado Chapa. All rights reserved.
//

import Foundation

struct User {
    let uid: String?
    let email: String?
    let name: String?
    
    init(uid: String, email: String, name: String) {
        self.uid = uid
        self.email = email
        self.name = name
    }
}
