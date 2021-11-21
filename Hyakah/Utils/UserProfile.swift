//
//  UserProfile.swift
//  Yahia Gallery
//
//  Created by taima on 3/10/20.
//  Copyright © 2020 mac air. All rights reserved.
//


import Foundation
import GoogleSignIn
import FBSDKLoginKit

class UserProfile {
    static let shared = UserProfile()
    
    // get Phone number from user
    
    var mobileNumber: String? {
        get {
            return UserDefaults.standard.value(forKey: "mobileNumber") as? String
        }
        set {
            UserDefaults.standard.setValue(newValue, forKey: "mobileNumber")
            UserDefaults.standard.synchronize()
        }
    }
    
    func isUserLogin() -> Bool {
        if  AccessToken.current != nil || GIDSignIn.sharedInstance()?.currentUser != nil {
            return true
            // User is logged in, do work such as go to next view controller.
        }

        return false
    }
    
    var isFirstTime: Bool? {
        get {
            return UserDefaults.standard.value(forKey: "isFirstTime") as? Bool
            
        }set {
            UserDefaults.standard.setValue(newValue, forKey: "isFirstTime")
        }
    }
}
