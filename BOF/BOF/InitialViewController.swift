//
//  InitialViewController.swift
//  BOF
//
//  Created by Shahin on 2017-04-30.
//  Copyright © 2017 98%Chimp. All rights reserved.
//

import UIKit
import M13ProgressSuite

class InitialViewController: UIViewController
{
    typealias segues = Constants.Identifiers.Segues
    
    // MARK: - Properties
    fileprivate var hud: M13ProgressHUD?
    fileprivate let currentUser = User.current
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    // MARK: - Outlets
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var logoVerticalConstraint: NSLayoutConstraint!
    
    // MARK: - View Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureView()
    }
    
    override func viewDidAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        simulateNetworkCall()
//        configureHUD()
    }
    
    // MARK: - Helpers
    func configureView()
    {
        setNeedsStatusBarAppearanceUpdate()
        configureHUD()
    }
    
    func simulateNetworkCall()
    {
        hud?.show(true)
        perform(#selector(presentHUDSuccess), with: nil, afterDelay: 2.0)
    }
    
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
        perform(#selector(routeUserToNextScreen), with: nil, afterDelay: 1.0)
    }
    
    func routeUserToNextScreen()
    {
        hud?.dismiss(true)
        
        if SessionService.shared.retrieveCredentials().2 == "" || !currentUser.isSignedIn
        {
            performSegue(withIdentifier: segues.toSigninStoryboard, sender: self)
        }
        else
        {
            performSegue(withIdentifier: segues.toMainStoryboard, sender: self)
        }
    }
}
