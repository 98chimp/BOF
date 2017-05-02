//
//  User.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import Foundation
import UIKit

class User
{
    fileprivate typealias userDefaultsKeys = Constants.UserDefaultKeys
    fileprivate typealias userKeys = Constants.Models.User
    
    // MARK: - Properties
    static let current = User()
    var profileImage = UIImage(named: "profile pic")
    var firstName = ""
    var lastName = ""
    var email = ""
    var password = ""
    var birthDate = Date()
    var bofHandle: String
    {
        return "@\(firstName)\(String(describing: lastName.characters.first))"
    }
    var token = ""
    var isSignedIn = false

    //MARK: - Parser(s)
    func parse(json:[String:Any]) -> User
    {
        let user = User()
        
        user.firstName = json[userKeys.firstName] as! String
        user.lastName = json[userKeys.lastName] as! String
        user.email = json[userKeys.email] as! String
        user.password = json[userKeys.password] as! String
        user.birthDate = json[userKeys.birthDate] as! Date
        
        return user
    }
    
    //MARK: - Zipper(s)
    func zipForLocalStorage() -> [String: Any]
    {
        var userDict:[String:Any] = [:]
        
        userDict[userKeys.firstName] = firstName as Any?
        userDict[userKeys.lastName] = lastName as Any?
        userDict[userKeys.birthDate] = birthDate as Any?
        userDict[userKeys.bofHandle] = bofHandle as Any?
        
        return userDict
    }

    // MARK: - Helpers
    func fullName() -> String
    {
        if firstName != "" && lastName != ""
        {
            return "\(firstName) \(lastName)"
        }
        else if firstName != ""
        {
            return firstName
        }
        else if  lastName != ""
        {
            return lastName
        }
        
        return ""
    }
}
