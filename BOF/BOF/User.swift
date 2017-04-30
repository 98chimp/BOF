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
    // MARK: - Properties
    static let currentUser = User()
    var profileImage = UIImage(named: "profile pic")
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    var passwordConfirm: String
    var birthDate = Date()

    init()
    {
        firstName = ""
        lastName = ""
        email = ""
        password = ""
        passwordConfirm = ""
    }
}
