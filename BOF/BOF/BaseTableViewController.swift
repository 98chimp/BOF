//
//  BaseTableViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit
import ThunderCats
import M13ProgressSuite

class BaseTableViewController: UITableViewController, UITextFieldDelegate
{
    // MARK: - Properties
    var hud: M13ProgressHUD?
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }

    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        addNotifications()
        configureHUD()
        setNeedsStatusBarAppearanceUpdate()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        removeNotifications()
    }
    
    // MARK: - Notifications
    fileprivate func addNotifications()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: .UIKeyboardWillHide, object: nil)
    }
    
    fileprivate func removeNotifications()
    {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - Handling Keyboard
    @objc func keyboardWillShow(_ notification: Notification) {    }
    
    @objc func keyboardWillHide(_ notification: Notification) {    }
    
    // MARK: - Progress HUD
    func configureHUD()
    {
        hud = M13ProgressHUD(progressView: M13ProgressViewRing())
        hud?.progressViewSize = CGSize(width: 60, height: 60)
        hud?.animationPoint = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/2)
        view.addSubview(hud!)
        hud?.status = "Processing"
        hud?.indeterminate = true
        hud?.setProgress(0.1, animated: true)
    }
    
    func presentHUDSuccess()
    {
        hud?.status = "Success!"
        hud?.setProgress(1.0, animated: true)
        hud?.indeterminate = false
        hud?.perform(M13ProgressViewActionSuccess, animated: true)
    }
}
