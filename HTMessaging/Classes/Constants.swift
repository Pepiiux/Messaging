//
//  Constants.swift
//  HTMessaging
//
//  Created by Hector Jose Alvarado Chapa on 22/12/19.
//  Copyright © 2019 Hector Jose Alvarado Chapa. All rights reserved.
//

import Foundation

enum Filetype: String {
    case plist = "plist"
}

enum FIRResponse {
    case successful
    case error
    case empty
    case invalidEmail
    case sessionExpired
    case userSignOut
    case userLogged
    case invalidPassword
    case EmailAlreadyInUse
}
