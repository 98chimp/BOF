//
//  SessionService.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import Foundation
import UICKeyChainStore

class SessionService
{
    fileprivate typealias userDefaultKeys = Constants.UserDefaultKeys
    fileprivate typealias keychainKeys = Constants.UICKeyChainStoreKeys
    
    //MARK: - Properties
    static let shared = SessionService()
    
    //MARK: - Keychain Store
    func storeCredentialsFor(_ user: User)
    {
        storeEmail(user.email)
        storePassword(user.password)
        storeToken(user.token)
    }
    
    func retrieveCredentials() -> (email: String, password: String, token: String)
    {
        return (retrieveEmail(), retrievePassword(), retrieveToken())
    }
    
    func clearKeychain()
    {
        UICKeyChainStore.removeAllItems()
    }
    
    func signout(_ user: User)
    {
        user.isSignedIn = false
    }
    
    func signin(_ user: User)
    {
        user.isSignedIn = true
    }
    
    fileprivate func storeEmail(_ email: String)
    {
        UICKeyChainStore.setString(email, forKey: keychainKeys.email)
    }
    
    fileprivate func retrieveEmail() -> String
    {
        return UICKeyChainStore.string(forKey: keychainKeys.email) ?? ""
    }
    
    fileprivate func storePassword(_ password: String)
    {
        UICKeyChainStore.setString(password, forKey: keychainKeys.password)
    }
    
    fileprivate func retrievePassword() -> String
    {
        return UICKeyChainStore.string(forKey: keychainKeys.password) ?? ""
    }
    
    fileprivate func storeToken(_ token: String)
    {
        UICKeyChainStore.setString(token, forKey: keychainKeys.token)
    }
    
    fileprivate func retrieveToken() -> String
    {
        return UICKeyChainStore.string(forKey: keychainKeys.token) ?? ""
    }
    
    //MARK: - User Defaults
    func storeUserInfo(_ userInfo: [String: Any])
    {
        UserDefaults.standard.set(userInfo, forKey: userDefaultKeys.userInfo)
        UserDefaults.standard.synchronize()
    }
    
    func retrieveUserInfo() -> [String: Any]
    {
        return UserDefaults.standard.object(forKey: userDefaultKeys.userInfo) as! [String : Any]
    }
    
    func removeUserInfo()
    {
        UserDefaults.standard.removeObject(forKey: userDefaultKeys.userInfo)
        UserDefaults.standard.synchronize()
    }
    
    func recordFirstRun()
    {
        UserDefaults.standard.set(true, forKey: userDefaultKeys.isSavedToKeychain)
        UserDefaults.standard.synchronize()
    }
    
    func isFirstRun() -> Bool
    {
        return UserDefaults.standard.bool(forKey: userDefaultKeys.isSavedToKeychain)
    }
}
