//
//  Credentials.swift
//  HTMessaging
//
//  Created by Hector Jose Alvarado Chapa on 22/12/19.
//  Copyright © 2019 Hector Jose Alvarado Chapa. All rights reserved.
//

import Foundation
import Firebase

public class Credentials {
    func signIn(withEmail email: String, password: String, completion: @escaping(_ user: User?, _ status: FIRResponse?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if error != nil {
                completion(nil, .error)
            } else {
                guard let usr = user?.user else {
                    completion(nil, .error)
                    return
                }
                let userInfo = User.init(uid: usr.uid, email: usr.email ?? String(), name: usr.displayName ?? String())
                completion(userInfo, .successful)
            }
        }
    }
    
    func signUp(with email: String, completion: @escaping(_ user: User?, _ status: FIRResponse?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: Credentials.autoGeneratePassword()) { user, error in
            if error != nil {
                completion(nil, .error)
            } else {
                if let user = user?.user {
                    let userData = User.init(uid: Credentials.getUID(), email: user.email ?? String(), name: String())
                    completion(userData, .successful)
                } else {
                    completion(nil, .error)
                }
            }
        }
    }
    
    static func signOut() -> FIRResponse? {
        do {
            try Auth.auth().signOut()
            return .userSignOut
        } catch {
            return .error
        }
    }
    
    static func logged() -> FIRResponse {
        return (Auth.auth().currentUser != nil) ? .userLogged : .sessionExpired
    }
    
    static private func getUID() -> String {
        guard let uid = Auth.auth().currentUser?.uid else {
            return String()
        }
        return uid
    }
    
    static func autoGeneratePassword() -> String {
        let length = 12
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
