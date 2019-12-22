//
//  Connection.swift
//  HTMessaging
//
//  Created by Hector Jose Alvarado Chapa on 22/12/19.
//  Copyright © 2019 Hector Jose Alvarado Chapa. All rights reserved.
//

import Foundation
import Firebase

public final class Connection {
    func withFirebaseFile(with fileName: String, ofType: Filetype) {
        guard let filePath = Bundle.main.path(forResource: fileName, ofType: ofType.rawValue) else { return }
        let options = FirebaseOptions(contentsOfFile: filePath)
        FirebaseApp.configure(options: options!)
    }
    
    func withFirebaseOptions(with googleAppID: String, gcmSenderID: String, apiKey: String, clientID: String, databaseURL: String) {
        let options = FirebaseOptions(googleAppID: googleAppID, gcmSenderID: gcmSenderID)
        options.apiKey = apiKey
        options.clientID = clientID
        options.databaseURL = databaseURL
        FirebaseApp.configure(options: options)
    }
}
