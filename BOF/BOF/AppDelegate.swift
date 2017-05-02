//
//  AppDelegate.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    // MARK: - Properties
    var window: UIWindow?

    // MARK: - Lifecycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        if !SessionService.shared.isFirstRun()
        {
            SessionService.shared.clearKeychain()
            SessionService.shared.recordFirstRun()
        }
        return true
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
        PostService.shared.areNewPostsAvailable = true
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        PostService.shared.areNewPostsAvailable = true
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        PostService.shared.areNewPostsAvailable = true
    }
}

