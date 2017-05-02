//
//  Constants.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

let kMinimumPasswordLength: Int = 8

func execute(after delay:Double, closure:@escaping ()->())
{
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + Double(Int64(delay * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC), execute: closure)
}

struct Constants
{
    struct Storyboards
    {
        static let initial = "Initial"
        static let signin = "Signin"
        static let welcome = "Welcome"
        static let main = "Main"
    }
    
    struct ViewControllers
    {
        static let initialVC = "InitialViewController"
        static let singinTVC = "SigninTableViewController"
        static let signupTVC = "SignupTableViewController"
        static let forgotPasswordTVC = "ForgotPasswordTableViewController"
        static let welcome1VC = "Welcome1VC"
        static let welcome2VC = "Welcome2VC"
        static let welcome3VC = "Welcome3VC"
        static let welcome4VC = "Welcome4VC"
        static let mainVC = "MainViewController"
        static let newPostVC = "NewPostViewController"
    }

    struct Identifiers
    {
        struct Cells
        {
            static let postCell = "postCell"
        }
        
        struct Segues
        {
            static let toMainStoryboard = "toMainStoryboard"
            static let toSigninStoryboard = "toSigninStoryboard"
            static let toForgotPasswordScreen = "toForgotPasswordScreen"
            static let toWelcomeStoryboard = "toWelcomeStoryboard"
            static let toSignupScreen = "toSignupScreen"
            static let toNewPostScreen = "toNewPostScreen"
        }
    }
    
    struct BOFTextField
    {
        static let iconFont = "FontAwesome"
        static let emailIcon = "\u{f0e0}"
        static let passwordIcon = "\u{f023}"
        static let calendar = "\u{f073}"
        static let person = "\u{f007}"
        static let firstNameErrorMessage = "invalid first name"
        static let lastNameErrorMessage = "invalid last name"
        static let emailErrorMessage = "invalid email address"
        static let passwordErrorMessage = "invalid password"
        static let confirmPasswordErrorMessage = "invalid password confirmation"
        static let birthDateErrorMessage = "invalid birthdate"
    }

    struct UserDefaultKeys
    {
        static let userInfo = "userInfo"
        static let isSavedToKeychain = "isSavedToKeychain"
    }
    
    struct UICKeyChainStoreKeys
    {
        static let email = "email"
        static let password = "password"
        static let token = "token"
    }
    
    struct Models
    {
        struct User
        {
            static let firstName = "firstName"
            static let lastName = "lastName"
            static let birthDate = "birthDate"
            static let bofHandle = "bofHandle"
            static let email = "email"
            static let password = "password"
            static let token = "token"
        }
    }
}
